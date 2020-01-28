drop database if exists lanhuongcosmetic;
create database lanhuongcosmetic;
use lanhuongcosmetic;
-- User --
drop table if exists user;
create table user(
	user_id int primary key auto_increment not null,
    user_name varchar(255) not null,
    user_email varchar(255) not null,
    user_pass varchar(20) not null,
    user_role bit not null
);

-- Category --
drop table if exists category;
create table category(
	category_id int primary key auto_increment not null,
    category_name varchar(255) not null
);

-- Product --
drop table if exists product;
create table product(
	product_id int primary key auto_increment not null,
    product_name varchar(255) not null,
    product_image longtext ,
    product_price double not null,
    product_description text,
    product_detail text,
    category_id int not null
);
alter table product add constraint fk_category_id foreign key (category_id) references category(category_id);

-- Bill --
drop table if exists bill;
create table bill(
	bill_id int primary key auto_increment not null,
    user_id int not null,
    full_name varchar(30) not null,
    total double not null,
    address varchar(255) not null,
    phone varchar(11) not null,
    date timestamp not null,
    status bit not null
    -- primary key (bill_id, user_id)
);
-- alter table bill add constraint pk_bill primary key (bill_id, user_id);
alter table bill add constraint fk_bill_user_id foreign key (user_id) references user(user_id);

-- BillDetail --
drop table if exists bill_detail;
create table bill_detail(
	bill_detail_id int primary key auto_increment not null,
    bill_id int not null,
    product_id int not null,
    quantity int not null,
    total double not null
);
alter table bill_detail add constraint fk_bill_id foreign key (bill_id) references bill(bill_id);
alter table bill_detail add constraint fk_product_id foreign key (product_id) references product(product_id);

-- Cart --
drop table if exists cart;
create table cart(
	cart_id int primary key auto_increment not null,
    user_id int not null,
    product_id int not null,
    total double not null,
    quantity int(10) not null
);
alter table cart add constraint fk_cart_user_id foreign key (user_id) references user(user_id);
alter table cart add constraint fk_cart_product_id foreign key (product_id) references product(product_id);
