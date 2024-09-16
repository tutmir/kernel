#ifndef _ListaUspavanihNiti_
#define _ListaUspavanihNiti_

#include "Scheduler.hpp"
#include "MemoryAllocator.hpp"
#include "TCB.hpp"


class ListaUspavanihNiti
{
  public:
    struct Elem
    {
      TCB *nit;
      Elem *sledeci;

      Elem(TCB *n, Elem *s) : nit(n), sledeci(s) {}
    };

  private:
      Elem *glava;
      Elem *rep;

  public:
    ListaUspavanihNiti() : glava(nullptr), rep(nullptr) {}
    ListaUspavanihNiti(const ListaUspavanihNiti &l) = delete;
    ListaUspavanihNiti operator=(const ListaUspavanihNiti &l) = delete;

    void probudiNiti();
    void dodajNit(TCB* nit);
};





#endif