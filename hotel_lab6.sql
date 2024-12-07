create database Hotel_lab5;
use Hotel_lab5;

create table HOTEL
 (
 Hotel_No int,
 Name varchar(40) not null,
 Address varchar(100),
 primary key (Hotel_No)
 );

create table ROOM
 (
 Room_No int,
 Hotel_No int,
 Type varchar (40),
 Price_per_night int,
 primary key (Room_No,Hotel_No),
 foreign key (Hotel_No) references HOTEL(Hotel_No)
 );


create table GUEST 
 (
 guest_no int,
 Name varchar (40) not null,
 address varchar (40),
 primary key(guest_no) 
 );

create table BOOKING
 (
 Hotel_No int,
 Guest_no int,
 Date_from date,
 Date_to date,
 Room_no int,
 primary key (Hotel_No , Guest_no ,Date_from ),
 foreign key (Guest_no) references GUEST(guest_no),
 foreign key (Hotel_No) references HOTEL(Hotel_No),
 foreign key (Room_no) references ROOM(Room_No)
 );



insert into HOTEL values(122,'Mariot','cairo');
insert into HOTEL values(222,' Hilton','Cairo');
insert into HOTEL values(352,'Park place','El-Gouna');
insert into HOTEL values(924,'Grosvenor','London');
insert into HOTEL values(565,'Devon Hotel','Boston');


insert into ROOM values(365,924,'single',29);
insert into ROOM values(487,924,'double',93);
insert into ROOM values(756,122,'single',150);
insert into ROOM values(142,352,'double',175);
insert into ROOM values(359,122,'single',160);
insert into ROOM values(653,222,'double',145);
insert into ROOM values(589,352,'double',38);
insert into ROOM values(235,565,'double',50);
insert into ROOM values(399,924,'single',63);
insert into ROOM values(168,924,'family',88);
insert into ROOM values(313,924,'family',252);
insert into ROOM values(213,924,'family',20);


insert into GUEST values(12,'John Mickel','London');
insert into GUEST values(21,'Samira sayed','Cairo');
insert into GUEST values(93,'Mohamed Yasser','Ramsis,Cairo');
insert into GUEST values(123,'Willam Candy','Boston');
insert into GUEST values(52,'Carla Nadal','London');

insert into BOOKING values(924,12,'04-05-02','04-04-7',365);
insert into BOOKING values(222,21,'04-04-15','04-04-15',653);
insert into BOOKING values(565,52,'04-04-01','04-04-05',235);
insert into BOOKING values(924,123,'04-04-15','04-04-15',399);
insert into BOOKING values(122,93,'04-04-01','04-04-7',359);
insert into BOOKING values(122,93,'04-04-05',null,359);