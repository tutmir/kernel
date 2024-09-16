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
 thread_t myHandle;
private:
 void (*telo)(void*);
 void *argumenti;


};

class Semaphore
{
public:

    Semaphore(unsigned init = 1);
    virtual ~Semaphore();
    int wait();
    int signal();
    int tryWait();
  private:

  sem_t myHandle;

};

class Console
{
  public:
  static char getc();
  static void putc(char);
};

class PeriodicThread : public Thread
{
  public:
    void terminate();
  protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation(){}
  private:
    time_t period;

};


#endif