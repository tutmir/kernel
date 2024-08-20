#ifndef _TCB_
#define _TCB_

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "MemoryAllocator.hpp"

class TCB;
class Thread;

using thread_t = TCB*;

class TCB
{
public:
    using Telo = void(*)(void*);

private:
   struct Context
   {
     uint64 ra;
     uint64 sp;
   };

   Telo telo;
   uint64 *stek;
   Context context;
   void *argumenti;
   bool zavrsena;
   bool blokirana;

   TCB(Telo body, void* argumenti, void *stek);

   static void popSppSpie();

   static void yield(Context *, Context*);

   friend Thread;

public:

   static void wrapper();

   static int napraviNit(thread_t* handle, Telo telo, void* argumenti, void* stek)
   {
     *handle = (thread_t) new TCB(telo, argumenti, stek);
     if(telo != nullptr)
       Scheduler::stavi(*handle);
     return 0;
   }
   static int napraviNitNeZapocni(thread_t* handle, Telo telo, void* argumenti, void* stek)
   {
       *handle = (thread_t) new TCB(telo, argumenti, stek);
       return 0;
   }

   static void start(TCB* nit)
   {
     if(nit->telo != nullptr)
       Scheduler::stavi(nit);
   }
   static void dispatch();
   static void exit();

   static TCB* trenutnaNit;

   bool daLiJeZavrsena() const
   {
      return zavrsena;
   }

   void postaviStatus(bool status)
   {
     this->zavrsena = status;
   }

   void blokiraj()
   {
     this->blokirana = true;
   }
   void odblokiraj()
   {
     this->blokirana = false;
   }

   bool daLiJeBlokirana() const
   {
     return this->blokirana;
   }

   ~TCB()
   {
     delete stek;
   }


};


#endif