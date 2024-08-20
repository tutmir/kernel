#ifndef _syscall_cpp_
#define _syscall_cpp_

#include "syscall_c.h"

class Thread
{
public:
Thread(void (*telo)(void*), void* argumenti);
virtual ~Thread();
int start();
static void dispatch();
static int sleep (time_t);
static void runWrapper(void* thread)
{
  if(thread != nullptr)
   ((Thread*) thread)->run();
}

protected:
 Thread();
 virtual void run() {};
private:
 thread_t myHandle;
 void (*telo)(void*);
 void *argumenti;


};



#endif