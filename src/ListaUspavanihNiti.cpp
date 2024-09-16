//
// Created by os on 9/8/24.
//
#include "../h/ListaUspavanihNiti.hpp"
#include "../test/printing.hpp"


void ListaUspavanihNiti::probudiNiti()
{
  if(glava == nullptr)
    return;

  Elem *trenutni = glava;
  Elem *prethodni = nullptr;
  while(trenutni != nullptr)
    {
      (trenutni->nit)->smanjiSleep();
      if(trenutni->nit->uspavana() == 0)
        {
          trenutni->nit->odblokiraj();
          Scheduler::stavi(trenutni->nit);
          if(prethodni)
            {
              prethodni->sledeci = trenutni->sledeci;
              if(trenutni == rep)
                {
                  rep = prethodni;
                }
            }
          else
            {
              glava = glava->sledeci;
              if(glava == nullptr)
                {
                  prethodni = nullptr;
                }
            }
          Elem *e = trenutni;
          trenutni = trenutni->sledeci;
          MemoryAllocator::mem_free(e);
        }
      else
        {
          prethodni = trenutni;
          trenutni = trenutni->sledeci;
        }
    }
}

void ListaUspavanihNiti::dodajNit(TCB *nit)
    {
      Elem *novi = (Elem*) MemoryAllocator::mem_alloc(sizeof(Elem));
      novi->nit = nit;
      novi->sledeci = nullptr;
      if(glava == nullptr)
        {
          glava = novi;
        }
      else
        {
          rep->sledeci = novi;
        }
      rep = novi;
    }