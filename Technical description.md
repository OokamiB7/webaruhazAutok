# Feladat leírása
- Főoldal
    - Kártyák
        - Keresés (X)
    - Részletek: egy ablakban termék leírása
        - Új mező a leírásra (X)
        - Képek (X)
        - Kosár (X)
        - Kosárba rakni (X)
- Adatkarbantartás 
    - Áruk kezelése (X)
- Kosár (X)
    - Kosárba rakni
    - Kosár műveletek
    - Bevétel lekérdezése

# Vásárlás folyamata
1. Belép a user
2. loggedInUsers táblához adunk egy új sort a belépés idejével
3. Kiolvassuk ennek az azonosítóját (shoppingId)
4. Ez az azonosító lesz a shoppingId (a cart táblába)
5. Amíg a user vásárol a cart táblába ezt a shopping Id-t adjuk meg

## A vásárlás részletei
- Ha megrendelés történt a bought true lesz
- Ha nem történt megrendelés akkor beragad false-ra
- Később ezt kilehet tisztítani
- A price az az éppen aktuális egységár
- Ebben az üzletben darabban vásárolunk 