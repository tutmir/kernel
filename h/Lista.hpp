#ifndef _Lista_
#define _Lista_

template<typename T>
class Lista
{
private:
struct Cvor
{
    T* podaci;
    Cvor* sledeci;

    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
};

  Cvor *pocetak, *kraj;

public:

Lista(): pocetak(nullptr), kraj(nullptr) {}

Lista(const Lista<T>&) = delete;
Lista<T> &operator=(const Lista<T>&) = delete;

void dodajNaPocetak(T* t)
{
Cvor *noviCvor = new Cvor(t, pocetak);
pocetak = noviCvor;
if(kraj == nullptr)
  kraj = noviCvor;
}

void dodajNaKraj(T* t)
{
Cvor *noviCvor = new Cvor(t, nullptr);
if(kraj != nullptr)
  {
     kraj = kraj->sledeci = noviCvor;
  }
  else
  {
    pocetak = kraj = noviCvor;
  }
}

T* izbaciPrvi()
{
  if(pocetak == nullptr)
    return nullptr;

  Cvor *cvor = pocetak;
  pocetak = pocetak->sledeci;

  if(pocetak == nullptr)
    kraj = nullptr;

  T* pv = cvor->podaci;
  delete cvor;
  return pv;
}

T* izbaciPoslednji()
{
if(pocetak == nullptr)
  return nullptr;

Cvor *prethodni = nullptr;
for(Cvor *trenutni = pocetak; trenutni != nullptr && trenutni != kraj; trenutni = trenutni->sledeci)
{
  prethodni = trenutni;
}

Cvor *cvor = kraj;
if(prethodni != nullptr){
  prethodni->sledeci = nullptr;
  }
else
{
  pocetak = nullptr;
}
    kraj = prethodni;
    T* pv = cvor->podaci;
    delete cvor;
    return pv;
}

T* dohvatiPrvi()
{
if(pocetak == nullptr)
  return nullptr;

return pocetak->podaci;
}
T* dohvatiPoslednji()
{
if(kraj == nullptr)
  return nullptr;

return kraj->podaci;
}

};


#endif