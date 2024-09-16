//
// Created by os on 8/19/24.
//

#include "../h/TCB.hpp"
#include "../h/syscall_c.h"
#include "../test/printing.hpp"


TCB* TCB::trenutnaNit = nullptr;
uint64 TCB::timeSliceBrojac = 0;

TCB::TCB(Telo telo, void* argumenti, void* stek, uint64 vreme) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), timeSlice(vreme), zavrsena(false), blokirana(false), sistemska(false) {}

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
  TCB::timeSliceBrojac = 0;

  if(staraNit != trenutnaNit)
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
  }
  //printString("DISPATCHOVAO\n");
}

int TCB::uspavajNit(time_t vreme)
    {
      if(vreme > 0)
        {
          trenutnaNit->blokiraj();
          trenutnaNit->uspavaj(vreme);
          Riscv::dodajUListu(trenutnaNit);
          TCB::dispatch();
          return 0;
        }
      else
          return -1;
    }

void TCB::exit()
{
  trenutnaNit->postaviStatus(true);
  dispatch();
}

void TCB::popSppSpie()
{
  if (TCB::trenutnaNit->sistemskaNit()==true) {
    Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
  }
  else {
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
  }
  __asm__ volatile ("csrw sepc,ra");
  __asm__ volatile ("sret");
}