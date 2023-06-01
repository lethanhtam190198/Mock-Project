create database quiz;
go
use quiz;
go
create table roles(
id int identity(1,1) primary key,
[name] varchar(20),
);
insert into roles (name) values ('ROLE_ADMIN'), ('ROLE_USER');
create table category(
id int identity(1,1) primary key,
[name] varchar(20),
);
insert into category (name) values ('MATH'), ('VIETNAMESE'),('ENGLISH');
create table classes(
id int identity(1,1) primary key,
[name] varchar(20),
);

insert into classes (name) values ('1'), ('2'),('3'),('4'),('5');

create table course(
id int identity(1,1) primary key,
categoryid int, 
classid int,
[name] nvarchar(100),
[status] varchar(20)  default 'on',
constraint fk_course_category foreign key (categoryid) references category( id),
constraint fk_class_course foreign key (classid) references classes(id)
);
insert into course (categoryid,classid,[name]) values ('1','1',N'Toán đại cương lớp 1'),
('2','2',N'Tiếng Việt lớp 2'),
('3', '3', 'English 3'),
('1',  '2',N'Toán đại cương lớp 2'),
('1', '3', 'English 1');
 
create table vip(
id int identity(1,1) primary key,
[name] varchar(20),
price money,
duration int,
[status] varchar(20) default 'on'
);

insert into vip ([name],price,duration) values ('NORMAL',0,0), ('VIP1','450000',6),
 ('VIP2','650000',9),
 ('VIP3','950000',12);

create table users(
id int identity(1,1) primary key,
nameofparent nvarchar(100),
nameofstudent nvarchar(100),
username varchar(100) unique,
email varchar(100) unique,
phone varchar(20)  unique,
[password] ntext,
avatar ntext,
[status] varchar(20) default 'on',
 );
  
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('marman0', 'Maridel Cowhig', 'Maisey Arman', 'marman0@seattletimes.com', '7947664997', 'MmTEJLxqTgAB', 'https://robohash.org/quiaquidemquo.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('lhowat1', 'Lenette Winder', 'Lind Howat', 'lhowat1@e-recht24.de', '7458936831', 'tFN14tuvKm', 'https://robohash.org/laudantiumliberobeatae.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('swestover2', 'Any Slyde', 'Sigismundo Westover', 'swestover2@etsy.com', '2998066691', 'JvEWFgoOf9', 'https://robohash.org/cumqueculpaiste.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('flealle3', 'Lezley MacKeller', 'Freedman Lealle', 'flealle3@nih.gov', '6539930050', 'tEjz3w8r2N', 'https://robohash.org/similiquequamut.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('nkelinge4', 'Vera Ivetts', 'Natalya Kelinge', 'nkelinge4@typepad.com', '8407781533', 'CW7igtKQxkn', 'https://robohash.org/suntquiaqui.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('jrodnight5', 'Georgianne Fulstow', 'Jada Rodnight', 'jrodnight5@telegraph.co.uk', '3434866814', 'cSjRLM2SxkRX', 'https://robohash.org/eumnullaexcepturi.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('lwithull6', 'Sarajane Hargroves', 'Leoline Withull', 'lwithull6@exblog.jp', '1036620818', 'Gke31mIT', 'https://robohash.org/estculpasoluta.png?size=50x50&set=set1' );
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('mjess7', 'Raimund Mandifield', 'Maggy Jess', 'mjess7@delicious.com', '4734844788', 'etxFUAD7sqH', 'https://robohash.org/quodolorumexercitationem.png?size=50x50&set=set1') ;
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('dthomkins8', 'Hope Habbeshaw', 'Dan Thomkins', 'dthomkins8@chicagotribune.com', '7034937539', 'Pmu5bRK', 'https://robohash.org/delectusquasvoluptas.png?size=50x50&set=set1');
insert into users (username, nameofparent, nameofstudent, email, phone, password, avatar ) values ('bdimeloe9', 'Rikki Worts', 'Bruno Dimeloe', 'bdimeloe9@istockphoto.com', '2667118151', 'VbF6sL', 'https://robohash.org/nostrumipsanatus.png?size=50x50&set=set1');

create table purchaseVIP(
id int identity(1,1) primary key,
userid int, 
vipid int,
timepurchase date,
constraint fk_purchase_user foreign key (userid) references users( id),
constraint fk_vip_purchase foreign key (vipid) references vip(id)
);

create table userrole(
username  varchar(100),
roleid int,
constraint fk_user_role foreign key (username) references users(username),
constraint fk_role_user foreign key (roleid) references roles( id)
);

create table question (
id int identity(1,1) primary key,
content nvarchar(200),
trueAnswer nvarchar(100),
falseAnswer nvarchar(100),
courseid int,
status varchar(10) default 'on',
unique (content,trueAnswer,falseAnswer),
constraint fk_question_course foreign key (courseid) references course( id),
 );

 create table exam (
id int identity(1,1) primary key,
userid int, 
point int, 
constraint fk_exam_user foreign key (userid) references users( id),
 );

 create table questionforexam(
id int identity(1,1) primary key,
examid int, 
questionid int,
answer ntext,
constraint fk_question_detail foreign key (questionid) references question( id),
constraint fk_question_exam foreign key (examid) references exam( id),
 );