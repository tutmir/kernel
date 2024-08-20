//
// Created by os on 8/12/24.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::Parce* MemoryAllocator::slobodnaMemorija;

int MemoryAllocator::mem_free(void* memorija)
{
    Parce *tmp = (Parce*)memorija - 1;

    if(!MemoryAllocator::slobodnaMemorija)
    {
     tmp->sledeci = nullptr;
     tmp->prethodni = nullptr;
     MemoryAllocator::slobodnaMemorija = tmp;
     return 0;
    }

    Parce *trenutni = MemoryAllocator::slobodnaMemorija;

    for(; trenutni < tmp && trenutni->sledeci != nullptr; trenutni = trenutni->sledeci);

    if(trenutni == slobodnaMemorija)
    {
      trenutni->prethodni = tmp;
      tmp->prethodni = nullptr;
      tmp->sledeci = trenutni;
      MemoryAllocator::slobodnaMemorija = tmp;
      spoji(tmp, tmp->sledeci);
      return 0;
    }
    else
    {
      if(tmp > trenutni)
      {
        trenutni->sledeci = tmp;
        tmp->prethodni = trenutni;
        tmp->sledeci = nullptr;
        spoji(tmp->prethodni, tmp);
        return 0;
      }
      else
      {
        tmp->sledeci = trenutni;
        tmp->prethodni = trenutni->prethodni;
        trenutni->prethodni->sledeci = tmp;
        trenutni->prethodni = tmp;
        spoji(tmp, tmp->sledeci);
        spoji(tmp->prethodni, tmp);
        return 0;
      }
    }

}


void* MemoryAllocator::mem_alloc(size_t velicina)
{
  if (velicina < 0 ) return nullptr;

   Parce *trenutni = MemoryAllocator::slobodnaMemorija, *prethodni = nullptr;

   for(; trenutni != nullptr && velicina > trenutni->velicina; prethodni = trenutni, trenutni = trenutni->sledeci);

   if(trenutni == nullptr)
   return nullptr;

   if(velicina < trenutni->velicina)
{
   size_t novoParce = (size_t) trenutni + velicina*MEM_BLOCK_SIZE;
   Parce *novi = (Parce*) novoParce;
   novi->velicina = trenutni->velicina - velicina;
   novi->sledeci = trenutni->sledeci;
   novi->prethodni = trenutni->prethodni;
   if (prethodni)
    prethodni->sledeci = novi;
   else
    MemoryAllocator::slobodnaMemorija = novi;
}
   else
{
   if(prethodni)
   prethodni->sledeci = trenutni->sledeci;
   else
   MemoryAllocator::slobodnaMemorija = trenutni->sledeci;
}
  trenutni->velicina = velicina;
  Parce *povratni = trenutni + 1;
  return povratni;

}

void MemoryAllocator::spoji (Parce *trenutni, Parce *sledeci)
{
   if(trenutni + trenutni->velicina == sledeci)
  {
     trenutni->velicina += sledeci->velicina;
     trenutni->sledeci = sledeci->sledeci;
     sledeci->sledeci->prethodni = trenutni;
  }
}




