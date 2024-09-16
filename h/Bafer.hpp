#ifndef _Bafer_
#define _Bafer_

#include "MojSemafor.hpp"

class Bafer
{
  char* buf;
  uint64 glava = 0;
  uint64 rep = 0;
  uint64 duzina = 0;
  MojSemafor *zauzeto;
  MojSemafor *slobodno;
  public:
    char getChar();
    void putChar(char c);
    Bafer(int d);

};



#endif