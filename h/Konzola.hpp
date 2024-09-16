#ifndef _Konzola_
#define _Konzola_

#include "MojSemafor.hpp"
#include "Bafer.hpp"

class Konzola
{
  static Bafer *in;
  static Bafer *out;
  public:

    static char getCharIn();
    static char getCharOut();
    static void putCharIn(char c);
    static void putCharOut(char c);
    static void inicijalizacija();

};

#endif