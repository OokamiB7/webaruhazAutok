# Feladat Leírás:
## Mi ez a program?

Ez egy fiktív webáruháznak az alkalmazása. Minden olyat tudunk benne csinálni mint egy rendes, élő webáruházon. Felhasználói szempontból lehet az árukat megnézni, kosárba rakni illetve a rendelés folyamata is szimulálva van. Fejlesztői szempontból, az árukat tudjuk kezelni: Hozzáadni új árukat, módosítani / törölni a meglévőket. Ennek a webáruháznak vannak fiókjai amik vagy felhasználói, vagy fejlesztői jogosultásgot kapnak.


## Üzembe helyezés
    Az üzembe helyezéshez ezek a programok kellenek: XAMPP, Visual Studio Code, dbForge, Git, NodeJS

    Első lépésként indítsuk el a XAMPP-ot. Szükségünk lesz az Apache és MySQL szerverre. A start gombbal elindítjuk.

    Második lépésként a webáruház adatbázisát kell importálnunk a számítógépre.
    A következő úton érhetjük el a szükséges fileokat:
        'webaruhazAutok\backend\database_shop_document'

        Ebben a mappában az adatbázis biztonsági mentését kell futtatni dbForge-al. Miután betöltött F5-el lefuttatjuk. Ezzel kész is vagyunk, megkaptuk a webáruház adatbázisát



 A 'webaruhazAutok' nevű mappát nyissuk meg Visual Studio Code programmal. Ezután a 'CTRL + Ö' kombinációval előhozzuk a terminalt. Három darab git bashre lesz sükségünk amit a jobb oldali plusz gombbal tudunk előállítani.

    Az első git bashbe a következő parancsokat kell írnunk:
        'cd backend' -> Ezzel a paranccsal a backend nevű mappába lépünk
        'npm run dev' -> Ezzel a paranccsal a backendbe lévő szervert tudjuk futtatni

    Az első git bash füllel kész vagyunk. Most lépjünk a másodikba
    A parancsok amiket bekell írni:
        'cd backend' -> Ismét a backend mappába kell lépnünk
        'npm run devauth' -> Ezzel a paraccsnal elindítjuk az authentikációs szervert ami a fiókokhoz fog kelleni

    Most pedig a harmadik git bashbe kell lépnünk
    A szükséges parancsok:
        'cd frontend' -> A frontend nevű mappába lépünk
        'npm run dev' -> A frontend mappába lévő klienst indítsuk el ezzel a paranccsal. Miután lefut a terminál kiír nekünk egy linket 'localhost' néven.

        A CTRL-t lenyomva kattintsuk rá a linkre és megnyílik a szerver kliens oldala az alapértelmezett böngészőnkkel. Immáron teljes üzembe helyeztük az alkalmazást.


