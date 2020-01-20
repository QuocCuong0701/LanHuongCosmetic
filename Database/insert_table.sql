use lanhuongcosmetic;

insert into user(user_name, user_email, user_pass, user_role) values ('admin','admin@gmail.com','12345',0);
insert into user(user_name, user_email, user_pass, user_role) values ('user','user@gmail.com','12345',1);
insert into user(user_name, user_email, user_pass, user_role) values ('user1','user1@gmail.com','12345',1);

insert into category(category_name) values('kem dưỡng'),('sữa tắm');

insert into product(product_name,product_price,category_id) values('Chống nắng trang điểm',100000,3),
('Serum trẻ hóa',200000,2);

insert into cart(user_id,product_id,total,quantity) values(3,1,200000,2), (4,2,200000,1);

insert into bill(user_id,total,address,phone,date) values(3,200000,'Hà Nội','0123456789',curdate()),
(4,200000,'Đà Nẵng','0987654321',curdate());

insert into bill_detail(bill_id,product_id,price,quantity) values(1,1,200000,2),(2,2,200000,1);