use lanhuongcosmetic;
-- user --
drop table if exists user;
create table user(
	user_id int primary key auto_increment,
    user_name varchar(255),
    user_email varchar(255),
    user_pass varchar(20),
    user_role bit
);
-- Product --
create table product(
	product_id int primary key auto_increment,
    product_name varchar(255),
    product_image varchar(255),
    product_price double,
    product_description text,
    product_detail text,
    category_id int
);
-- Category --
create table category(
	category_id int primary key auto_increment,
    category_name varchar(255)
);
--  --