# Műszaki leírás

## Mappastruktúra
A 'webaruhazAutok' nevű mappa a főmappánk. Ebbe találhatjuk a backend és frontend mappáját. Emellé itt tároljuk a hozzátartozó prezentációt, README, Technical description és User Guide fileokat. 

### Backend mappa

    Itt találatjuk a backendhez tartozó fileokat mint például a node modulest, gitignore, request rest, serverdata, serverauth

    A database_shop_document mappába van letárolva az adatbázishoz tartozó fileok: biztonsági mentések, ábrák, diagrammok 

### Frontend mappa
    Itt pedig a klienshez tartozó fileok vannak letárolva. Ebben van webáruházhoz szükséges képek, komponensek, modulok, views és minden egyéb fontos file ami a kliens működtetéséhez és üzembe helyezéséhez fontos

## Hogy működik a feladat
### Backend leírása

A webáruház összes adata a hozzátartozó adatbázisban van letárolva carproducts néven. Itt tároljuk az árukat, a kosarat, és a felhasználókat.

A tábláink: 
    users -> az összes felhasználó
    products -> áruk
    cart -> kosár
    loggedinusers -> a jelenpillanatba belépett felhasználók


Az adatbázis diagramja:
    
![Adatbázis diagram](adatbazisAbra.png)


A 'database_shop_document' nevű mappában találhatjuk az adatbázis biztonsági mentéseit, SQL-fileját illetve a diagram ábráját képformátumban és dbd formátumban is.

Ha az adatbázis levan telepítve a számítógépünkre, beindíthatjuk a szervereket. Ezt a git bash segítségével tudjuk megtenni.



Miután beléptünk a backend mappába a "cd backend" paranccsal kiadhatjuk az "npm run dev" parancsot amivel az adatszervert indítjuk el. Az "npm run devauth" paranccsal pedig az authentikációs szervert indítjuk el.

A request.rest fileba vannak írva parancsok mint például a bejelentkezés, token kérés, illetve különböző CRUD műveletek -> Get, post, put, delete

Itt tudjuk ellenőrizni, hogy ezek a parancsok működnek-e

### Frontend leírása

    Az imgs mappába található az összes képfile amit a webáruház használ

    A node_modules mappába pedig a modulok találhatóak

Az src mappába tároljuk le a frontend gyökerét. Itt találjuk a viewsokat (AboutView, AruKezeles, HomeView, LoginView)

A store mappában különböző javascript fileokat találhatunk (keres,login,url)
Ezekbe a fileokba különböző függvények vannak írva amiket a webáruház használ. Pl keresés, bejelentkezés illetve a különböző url-ek is itt vannak tárolva


A router mappában az a javascript file található amibe a routerek vannak letárolva. Példa:

```js
{
            path: "/AruKezeles",
            name: "AruKezeles",
            component: () =>
                import ("../views/AruKezeles.vue"),
            meta: {
                requiresAuth: true,
                title: "Áruk Kezelése",
            },
        },
```

Ennek a segítégével a különböző viewokat tudjuk elérni.

    A components mappába vannak az oldal különböző komponensei. A carosuel.vue az oldal tetején lévő carousel. A menu.js pedig a carousel alatt lévő menü ahol a különböző viewokat érjük el. Emellé a menüben van a kosár ikonja és a keresési mező is aminek a segítségével keresni tudunk az áruk között

Az assets mappába találjuk a main.css filet. A main.css fileba írjuk meg azokat a kódokat amelyek majd az oldal összes viewját befolyásolja. Például ha a main.css-be beírjuk a következő parancsot:

```css
body{
    background-color: red;
}
```

Akkor az összes view háttérszíne piros lesz. Mivel a webáruház háttérszíne sötét, és a szövegek alapértelmezett színe fekete, a main.css fileba oldottuk meg, hogy az összes szöveg fehér legyen.



### Az oldal szerekezete

Elsőként a HomeView.vue töltődik be. Ez a főoldal. Az áruk, amiket az adatbázisból kapunk meg egy bootstrap-es kártya formátumba jelenik meg. Láthatjuk az áruk képeit, neveit és egységáraikat. A megtekintés gombra kattintva egy modal ablak előugrik ahol további információkat kapunk a termékről. Emellé a modal footerébe elhelyezett mező segítéségvel az adott terméket a kosárba rakhatjuk.

Az oldal tetején töltődik be a carousel és a menu. A menube találhatjuk a különböző viewokat, a keresési mezőt és miután a kosárba helyeztünk egy árut, a kosár ikonja is megjelenik. 

A menube tudunk lépegetni a viewok között: Home, About, Login. Ha bevagyunk jelentkezve akkor tudunk az Áru kezelési viewba menni.