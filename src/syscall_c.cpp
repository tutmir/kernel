//
// Created by os on 8/16/24.
//

#include "../h/syscall_c.h"
#include "../h/Riscv.hpp"
#include "../lib/console.h"



void Riscv::handleSupervisorTrap()
{
  uint64 scause;
  __asm__ volatile ("csrr %0, scause" : "=r" (scause));

  if(scause == 0x08UL || scause == 0x09UL)
  {
    uint64 volatile sepc, sstatus;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    sepc += 4;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    uint64 kod, pv;
    __asm__ volatile ("mv %0, a0" : "=r" (kod));


    switch (kod)
    {
     //mem_alloc
     case 0x01:
     {
       size_t size;
       void* ptr;
       __asm__ volatile("mv %0, a1" : "=r" (size));
       ptr = MemoryAllocator::mem_alloc(size);

       __asm__ volatile("mv t0, %0" : : "r"(ptr));
       __asm__ volatile ("sw t0, 80(x8)");
       break;
     }
     //mem_free
     case 0x02:
     {
       void* memptr;
       __asm__ volatile("mv %0, a1" : "=r" (memptr));

       pv = MemoryAllocator::mem_free(memptr);

       __asm__ volatile("mv t0, %0" : : "r"(pv));
       __asm__ volatile ("sw t0, 80(x8)");
       break;
     }
     //thread_create
     case 0x11:
     {
       void *argumenti, *stek;
       Telo telo;
       thread_t* thread;
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));

       pv = TCB::napraviNit(thread, telo, argumenti, stek);
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //thread_exit
     case 0x12:
     {
       pv = 0;
       TCB::trenutnaNit->exit();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //thread_dispatch
     case 0x13:
     {
       TCB::dispatch();
       break;
     }
     //thread_start
     case 0x14:
     {
       TCB* thread;
       __asm__ volatile("mv %0, a1" : "=r"(thread));
       TCB::start(thread);
       break;
     }
     //thread_no_start
     case 0x15:
     {
       void *argumenti, *stek;
       Telo telo;
       thread_t* thread;
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));

       pv = TCB::napraviNitNeZapocni(thread, telo, argumenti, stek);
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //sem_open
     case 0x21:
     {
       sem_t *handle;
       uint64 init;
       __asm__ volatile("mv %0, a1" : "=r"(handle));
       __asm__ volatile("mv %0, a2" : "=r"(init));
       pv = MojSemafor::sem_open(handle, init);
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //sem_close
     case 0x22:
     {
       sem_t handle;
       __asm__ volatile("mv %0, a1" : "=r"(handle));
       pv = handle->close();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //sem_wait
     case 0x23:
     {
       sem_t id;
       __asm__ volatile("mv %0, a1" : "=r"(id));
       pv = id->wait();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //sem_signal
     case 0x24:
     {
       sem_t id;
       __asm__ volatile("mv %0, a1" : "=r"(id));
       pv = id->signal();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //sem_trywait
     case 0x26:
     {
       sem_t id;
       __asm__ volatile("mv %0, a1" : "=r"(id));
       pv = id->trywait();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //getc
     case 0x41:
     {
       pv = __getc();
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
       break;
     }
     //putc
     case 0x42:
     {
       char c;
       __asm__ volatile ("mv %0, a1" : "=r"(c));
       __putc(c);
       break;
     }
     default:{
       break;
       }
    }
    __asm__ volatile ( "csrw sstatus, %0" : : "r"( sstatus ) );
    __asm__ volatile ( "csrw sepc, %0" : : "r"( sepc ) );
  }

}


int mem_free (void* ptr) {

    __asm__ volatile("mv a1, %0" : : "r"(ptr));
    __asm__ volatile("li a0, 0x02");
    __asm__ volatile("ecall");


    uint64 returnValue;
    __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    return (int)returnValue;
}

void* mem_alloc(size_t size) {
  size_t newSize;
  if(size%MEM_BLOCK_SIZE != 0) {
    newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
  }
  else {
    newSize = size;
  }

  __asm__ volatile("mv a1, %0" : : "r"(newSize));
  __asm__ volatile("li a0, 0x01");
  __asm__ volatile("ecall");

  //check this
  void *returnValue;
  __asm__ volatile("mv %0, a0" : "=r"(returnValue));
  return returnValue;
}

int thread_create(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
  __asm__ volatile("mv a4, %0" : : "r"(stek));
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
  __asm__ volatile("mv a1, %0" : : "r"(handle));
  __asm__ volatile ("li a0, 0x11");

  __asm__ volatile ("ecall");

  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int thread_no_start(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
  __asm__ volatile("mv a4, %0" : : "r"(stek));
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
  __asm__ volatile("mv a1, %0" : : "r"(handle));
  __asm__ volatile ("li a0, 0x15");

  __asm__ volatile ("ecall");

  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int thread_exit()
{
  uint64 pv;

  __asm__ volatile ("li a0, 0x12");
  __asm__ volatile ("ecall");
  __asm__ volatile ("mv %0, a0" : "=r"(pv));
  return pv;
}

void thread_dispatch()
{
  __asm__ volatile ("li a0, 0x13");
  __asm__ volatile ("ecall");
}

void thread_start(TCB* thread)
{
  __asm__ volatile("mv a1, %0" : : "r"(thread));
  __asm__ volatile("li a0, 0x14");
  __asm__ volatile ("ecall");
}

int sem_open(sem_t *handle, unsigned init)
{
  uint64 pv;
  __asm__ volatile("mv a2, %0" : : "r"(handle));
  __asm__ volatile("mv a1, %0" : : "r"(init));
  __asm__ volatile("li a0, 0x21");
  __asm__ volatile("ecall");
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int sem_close(sem_t handle)
{
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(handle));
  __asm__ volatile("li a0, 0x22");
  __asm__ volatile("ecall");
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int sem_wait(sem_t id)
{
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
  __asm__ volatile("li a0, 0x23");
  __asm__ volatile("ecall");
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int sem_signal(sem_t id)
{
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
  __asm__ volatile("li a0, 0x24");
  __asm__ volatile("ecall");
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int sem_trywait(sem_t id)
{
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
  __asm__ volatile("li a0, 0x26");
  __asm__ volatile("ecall");
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

char getc()
{
  char c;
  __asm__ volatile ("li a0, 0x41");
  __asm__ volatile ("ecall");
  __asm__ volatile ("mv %0, a0" : "=r"(c));
  return c;
}

void putc(char c)
{
  __asm__ volatile("mv a1, %0" : : "r"(c));
  __asm__ volatile ("li a0, 0x42");
  __asm__ volatile ("ecall");

}

void Riscv::handleTimerInterrupt() {
  mc_sip(SIP_SSIP);
}

void Riscv::handleConsoleInterrupt() {
  console_handler();
}


