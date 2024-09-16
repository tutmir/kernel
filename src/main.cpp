//
// Created by os on 8/13/24.
//

#include "../h/syscall_c.h"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../test/printing.hpp"
#include "../h/Konzola.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
  userMain();
}

void console_out(void*)
{
   while(true)
     {
       volatile char status = *((char*)CONSOLE_STATUS);
       while ((status & CONSOLE_TX_STATUS_BIT)) {
            char c = Konzola::getCharOut();
            *((char*)CONSOLE_TX_DATA) = c;
            status = *((char*)CONSOLE_STATUS);
            }
     }
}
void idleWrapper(void*)
{
    while (true) { thread_dispatch(); }
}


int main() {
TCB *threads[5];


 MemoryAllocator::initFreeBlock();
 Konzola::inicijalizacija();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);

 thread_create(&threads[0], nullptr, nullptr);
 threads[0]->postaviSistemsku();
 TCB::trenutnaNit = threads[0];

 thread_create(&threads[1], console_out, nullptr);
 threads[1]->postaviSistemsku();
 thread_create(&threads[2], idleWrapper, nullptr);

 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

 thread_create(&threads[3], &wrapperMain, nullptr);
 threads[3]->postaviSistemsku();


 while( !threads[3]->daLiJeZavrsena())
{
  thread_dispatch();
}

 return 0;

}