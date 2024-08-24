#ifndef _MojSemafor_
#define _MojSemafor_

#include "Lista.hpp"
#include "TCB.hpp"

class MojSemafor
{
  private:

  Lista<TCB> blokirane;
  bool otvoren;
  int vrednost;

  MojSemafor(int v = 1);
  ~MojSemafor();
  public:

   using sem_t = MojSemafor*;

   int signal();
   int wait();
   int close();
   int trywait();

   static int sem_open(sem_t*, unsigned);
};




#endif