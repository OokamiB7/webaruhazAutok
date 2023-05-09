﻿### Adatbázis létrehozása

CREATE DATABASE carproducts
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;


### Táblák létrehozása

## users
  CREATE TABLE carproducts.users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  username VARCHAR(255) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

 
  ### products

  CREATE TABLE carproducts.products (
  id INT(11) NOT NULL AUTO_INCREMENT,
  productName VARCHAR(255) DEFAULT NULL,
  quantity INT(11) DEFAULT NULL,
  price INT(11) DEFAULT NULL,
  isInStock VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


  ### Tesztadatok

  select * from products;
  select * from users;

  delete from products;
  delete from users;

  insert into users (id,firstName,lastName,username,password,email)
    values
    (1,'Admin','Bácsi','admin',123,'adminba@gmail.com'),
    (2,'Kovács','Ferenc','kferi','feri123','kferenc@gmail.com'),
    (3,'Nagy','Zsolt','nzsolti',123456,'zsoltinagy@gmail.com');


  insert into products (id,productName,quantity,price,isInStock)
    VALUES
    (1, 'Féktárcsa', 10, 3500, 1),
    (2, 'Téli gumi', 0, 6500, 0),
    (3, 'Nyáru gumi', 4, 5500, 1);




  ### CRUD Műveletek
    ## sima get
     select * from products;
     


    ## get by id
    select * from products
      where id = 1;


    ##post
    insert products (productName,quantity,price,isInStock)
      VALUES
      ('sqltesztProduct', 2, 5555, 1);

    ##put
    update products set
      productName = sqltesztProductUPDATE,
      quantity = 0,
      price = 11111,
      isInStock = 0
      where id = 4;

    ##delete
    delete from products where id = 4;



    ## users rész
    select * from users;

    
    ## get by id
    select * from users
      where id = 1;

    ##post
    insert users (firstName,lastName,username,password,email)
      VALUES
      ('Proba','User','probauser',555,'probaemail@gmail.com');

    ##put
    update users set
      firstName = 'updateProba',
      lastName = 'updateLast',
      username = 'updateName',
      password = 777,
      email = 'updateEmail@gmail.com'
      where id = 4;

    ##delete
    delete from users where id = 4;