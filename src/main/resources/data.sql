insert into `users` (id, email, join_date, password, username) values (100, 'doctorS@gmail.com', '2023-04-12 15:30:00', 'doctorS', 'doctorS');
insert into `users` (id, email, join_date, password, username) values (101, 'mrdangcap@gmail.com', '2023-04-12 15:30:00', 'mrdangcap', 'mrdangcap');
insert into `users` (id, email, join_date, password, username) values (102, 'giaosu@gmail.com', '2023-04-12 15:30:00', 'giaosu', 'giaosu');

insert into category (id, title) values (100, 'LOL');
insert into category (id, title) values (101, 'Dota');

insert into topic(id, category_id, content, created_time, title, creator_id) values (100, 100, 'tinhf trang lobby hien nay',  '2012-09-17 18:47:52.69', 'ingame', 101);
insert into topic(id, category_id, content, created_time, title, creator_id) values (101, 100, 'leo rank', '2012-09-17 18:47:52.69', 'tips', 102);

insert into `message`(id, content, created_time, title, creator_id, topic_id) values (100, 'do ngu', '2012-09-17 18:47:52.69', 'RE: ingame', 101, 100);
insert into `message`(id, content, created_time, title, creator_id, topic_id) values (101, 'danh rank nhieu vao', '2012-09-17 18:47:52.69', 'RE: tips', 102, 101);



