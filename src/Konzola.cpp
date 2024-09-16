//
// Created by os on 9/10/24.
//

#include "../h/Konzola.hpp"

Bafer *Konzola::in;
Bafer *Konzola::out;

void Konzola::inicijalizacija()
    {
      in = new Bafer(1024);
      out = new Bafer(1024);
    }

char Konzola::getCharIn()
        {
            return in->getChar();
        }
char Konzola::getCharOut()
        {
            return out->getChar();
        }
void Konzola::putCharIn(char c)
        {
            in->putChar(c);
        }
void Konzola::putCharOut(char c)
        {
            out->putChar(c);
        }