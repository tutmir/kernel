//
// Created by os on 8/19/24.
//


#include "../h/Scheduler.hpp"

Lista<TCB> Scheduler:: listaNiti;

void Scheduler::stavi(TCB* tcb)
{
  listaNiti.dodajNaKraj(tcb);
}

TCB* Scheduler::uzmi()
{
   return listaNiti.izbaciPrvi();
}