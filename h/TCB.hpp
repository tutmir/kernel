#ifndef _TCB_
#define _TCB_

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "MemoryAllocator.hpp"
#include "Riscv.hpp"

class TCB;
class Thread;

using thread_t = TCB*;

class TCB
{
public:
    using Telo = void(*)(void*);

private:
   friend class Riscv;
   struct Context
   {
     uint64 ra;
     uint64 sp;
   };

   Telo telo;
   uint64 *stek;
   Context context;
   void *argumenti;
   uint64 timeSlice;
   time_t josUspavana;

   bool zavrsena;
   bool blokirana;
   bool sistemska;

   TCB(Telo body, void* argumenti, void *stek, uint64 vreme);

   static void popSppSpie();

   static void yield(Context *, Context*);

   friend Thread;

public:



   static void wrapper();

   static int napraviNit(thread_t* handle, Telo telo, void* argumenti, void* stek, uint64 vreme)
   {
     *handle = (thread_t) new TCB(telo, argumenti, stek, vreme);
     if(telo != nullptr)
       Scheduler::stavi(*handle);
     return 0;
   }
   static int napraviNitNeZapocni(thread_t* handle, Telo telo, void* argumenti, void* stek, uint64 vreme)
   {
       *handle = (thread_t) new TCB(telo, argumenti, stek, vreme);
       return 0;
   }

   static void start(TCB* nit)
   {
     if(nit->telo != nullptr)
       Scheduler::stavi(nit);
   }
   static void dispatch();
   static void exit();

   static int uspavajNit(time_t vreme);

   static uint64 timeSliceBrojac;
   static TCB* trenutnaNit;

   void smanjiSleep()
   {
      josUspavana--;
   }

   void uspavaj(time_t vreme)
   {
      josUspavana = vreme;
   }

   time_t uspavana()
   {
     return josUspavana;
   }

   uint64 dohvatiTimeSlice()
   {
     return timeSlice;
   }

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

  bool sistemskaNit() const {
     return sistemska;
   }

  void postaviSistemsku() {
     sistemska=true;
   }

   ~TCB()
   {
     delete stek;
   }


};


#endif