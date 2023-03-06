# 1. Adatbázis létrehozása

  CREATE DATABASE carparts
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;


  # 2. Tesztadatok

  insert into product (id,name,price,quantity) VALUES
    (1,'Féktárcsa','3500','3');

    select * from product;
    delete from product;