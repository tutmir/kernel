#ifndef _Scheduler_
#define _Scheduler_

#include "Lista.hpp"

class TCB;

class Scheduler
{
  private:

    static Lista<TCB> listaNiti;
  public:

  static void stavi (TCB* tcb);
  static TCB* uzmi();

};

#endif