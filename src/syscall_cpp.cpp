//
// Created by os on 8/20/24.
//

#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*telo)(void*), void* argumenti)
{
  thread_create(&myHandle, telo, argumenti);
}

Thread::~Thread()
{
 delete myHandle;
}

int Thread::start()
{
  thread_start(this->myHandle);
  return 0;
}

void Thread::dispatch()
{
  thread_dispatch();
}

int Thread::sleep(time_t t)
{
  return time_sleep(t);
}

Thread::Thread()
{
  thread_no_start(&myHandle, &runWrapper, this);
}

Semaphore::Semaphore(unsigned init)
{
  sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore()
{
  sem_close(myHandle);
}

int Semaphore::wait()
{
  return sem_wait(myHandle);
}

int Semaphore::signal()
{
  return sem_signal(myHandle);
}

int Semaphore::tryWait()
{
  return sem_trywait(myHandle);
}

char Console::getc()
{
 return syscall_c::getc();
}

void Console::putc(char c)
{
  syscall_c::putc(c);
}