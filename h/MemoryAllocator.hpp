#ifndef _MemoryAllocator_
#define _MemoryAllocator_
#include "../lib/hw.h"

class MemoryAllocator {

 public :
 struct Parce{
  size_t velicina;
  Parce *prethodni, *sledeci;

 };

 static Parce* slobodnaMemorija;

 static int mem_free (void *memorija);
 static void* mem_alloc(size_t velicina);
 static void inicijalizacija()
 {
  slobodnaMemorija = (Parce*) HEAP_START_ADDR;
  slobodnaMemorija->sledeci = nullptr;
  slobodnaMemorija->prethodni = nullptr;
  slobodnaMemorija->velicina = ((uint64) HEAP_START_ADDR - (uint64) HEAP_END_ADDR)/MEM_BLOCK_SIZE;
 }
 private:
 static void spoji(Parce* trenutni, Parce* sledeci);


};


#endif