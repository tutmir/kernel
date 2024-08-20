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
  return 0;
}

Thread::Thread()
{
  thread_no_start(&myHandle, &runWrapper, this);
}