# 1. Adatbázis létrehozása

  CREATE DATABASE carparts
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;


  # 2. Tesztadatok

  insert into product (id,name,price,quantity) VALUES
    (1,'Féktárcsa','3500','3');

  insert into users (id,name,password) VALUES
    (1,'Admin','adminpassword');

    insert into cart (id,userid,productid,quantity) values
      (10,1,1,2);

    select * from product;
    select * from users;
    select * from cart;

    delete from product;
    delete from users;
    delete from cart;