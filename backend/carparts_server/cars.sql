# 1. Adatbázis létrehozása

  CREATE DATABASE carparts
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;


  # 2. táblák

    CREATE TABLE carparts.users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(50) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  userName VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  number INT(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


    CREATE TABLE carparts.product (
  id INT(11) NOT NULL AUTO_INCREMENT,
  productName VARCHAR(255) DEFAULT NULL,
  price INT(11) DEFAULT NULL,
  quantity INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;


  CREATE TABLE carparts.cart (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userid INT(11) NOT NULL,
  productid INT(11) NOT NULL,
  quantity INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

  # 3. Tesztadatok

  insert into product (id,productName,price,quantity) VALUES
    (1,'Féktárcsa','3500','3');

  insert into users (id,firstName,lastName,gender,userName,email,password,number) VALUES
    (1,'Kiss','Ádám',1,'bonedragonHUN666','kiss.adam@gmail.com',123456,062042069);

    insert into cart (id,userid,productid,quantity) values
      (10,1,1,2);

    select * from product;
    select * from users;
    select * from cart;

    delete from product;
    delete from users;
    delete from cart;