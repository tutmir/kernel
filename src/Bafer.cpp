//
// Created by os on 9/10/24.
//

#include "../h/Bafer.hpp"

Bafer::Bafer(int d) : glava(0), rep(0)
     {
         duzina = d;
         buf = (char*)MemoryAllocator::mem_alloc(duzina*sizeof(char));
         MojSemafor::sem_open(&zauzeto, 0);
         MojSemafor::sem_open(&slobodno, d);
     }

void Bafer::putChar(char c)
     {
          slobodno->wait();
          buf[rep] = c;
          rep++;
          if(rep >= duzina)
            rep%=duzina;
          zauzeto->signal();
     }

char Bafer::getChar()
     {
        zauzeto->wait();
        char c = buf[glava];
        glava++;
        if(glava >= duzina)
          glava%=duzina;
        slobodno->signal();
        return c;
     }