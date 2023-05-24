### Adatbázis létrehozása

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

  select id, productName,quantity,price,isInStock,description from products
    where productName like 'a'
    order by productName;

  delete from products;
  delete from users;

 update users set number = 1
  where username = 'admin';

 update users set number = 0
  where username != 'admin';


  insert into products (productName,quantity,price,isInStock, description)
    VALUES
    ('Katalizátor', 7, 5200000, 5, 'teszt leírás');
    




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

   

   
    ##delete
    delete from users where id = 4;


#select
    select * from users;
    select * from loggedinusers;
    select * from products;
    select * from cart;


    delete from cart;


    #post loggedinusers
  insert into loggedinusers
    (userId)
    VALUES
    (4);


  #post cart
    insert into cart
      (userId,productId,bought,quantity,price,shoppingId)
      VALUES
      (5,35,false,1,1200,5);


    #get cartQuantity
      select count(*) quantity from cart
        where shoppingId = 25;


      #cartbyShoppingId

      select c.id, p.productName,c.quantity, c.price unitPrice, c.quantity*c.price price  from cart c
        inner join products p on p.id = c.productId
      where c.shoppingId = 25;


      #cartbyShoppingId
        delete * from cart
          where id = 98;



     