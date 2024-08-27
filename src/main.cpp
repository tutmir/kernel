//
// Created by os on 8/13/24.
//

#include "../h/syscall_c.h"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../test/printing.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
  userMain();
}


int main() {
TCB *threads[5];


 MemoryAllocator::initFreeBlock();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
 thread_create(&threads[0], nullptr, nullptr);
 TCB::trenutnaNit = threads[0];


 thread_create(&threads[1], &wrapperMain, nullptr);


 while( !threads[1]->daLiJeZavrsena())
{
  thread_dispatch();
}

 return 0;

}