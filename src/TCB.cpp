//
// Created by os on 8/19/24.
//

#include "../h/TCB.hpp"
#include "../h/syscall_c.h"


TCB* TCB::trenutnaNit = nullptr;

TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}

void TCB::wrapper()
{
  popSppSpie();
  trenutnaNit->telo((void*) trenutnaNit->argumenti);
  trenutnaNit->postaviStatus(true);
  thread_dispatch();
}

void TCB::dispatch()
{
  TCB* staraNit = trenutnaNit;
  if(!staraNit->daLiJeZavrsena() && !staraNit->daLiJeBlokirana())
  {
    Scheduler::stavi(staraNit);
  }

  trenutnaNit = Scheduler::uzmi();

  if(staraNit != trenutnaNit)
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
  }
}

void TCB::exit()
{
  trenutnaNit->postaviStatus(true);
  dispatch();
}

void TCB::popSppSpie()
{
  __asm__ volatile ("csrw sepc, ra");
  __asm__ volatile("sret");
}