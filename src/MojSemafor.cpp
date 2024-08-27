//
// Created by os on 8/22/24.
//

#include "../h/MojSemafor.hpp"
#include "../test/printing.hpp"
int MojSemafor::sem_open(sem_t* handle, unsigned init)
{
  *handle = new MojSemafor(init);
  return 0;
}

MojSemafor::~MojSemafor()
{
  if(otvoren)
    close();
}

MojSemafor::MojSemafor(unsigned int v)
{
  vrednost = v;
  otvoren = true;
}

int MojSemafor::signal()
{
  if(!otvoren)
    return -1;

  TCB *thread;
  if(++vrednost <= 0)
  {
    thread = blokirane.izbaciPrvi();
    if(thread == nullptr)
    {
      return 0;
    }
    thread->odblokiraj();
    Scheduler::stavi(thread);
  }
  return 0;
}

int MojSemafor::wait()
{
  if(!otvoren)
    return -1;

  if(--vrednost < 0)
  {
    TCB::trenutnaNit->blokiraj();
    blokirane.dodajNaKraj(TCB::trenutnaNit);
    TCB::dispatch();
    if(!otvoren)
      return -2;
  }
  return 0;

}

int MojSemafor::close()
{
  if(!otvoren)
    return -1;

  otvoren = false;
  while(blokirane.dohvatiPrvi() != nullptr)
  {
    TCB *thread = blokirane.izbaciPrvi();
    thread->odblokiraj();
    Scheduler::stavi(thread);
  }

  return 0;
}

int MojSemafor::trywait()
{
  if(vrednost <= 0)
    return 1;
  else
  {
    vrednost--;
    return 0;
  }
}
