# 숙제
create table tbl_client(
    email varchar(255) primary key,
    password varchar(255) not null,
    name varchar(255) not null
);

create table tbl_office(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    location varchar(255) not null
);

create table tbl_conference_room(
    id bigint auto_increment primary key,
    office_id bigint not null,
    constraint fk_conference_room_office foreign key(office_id)
                                references tbl_office(id)
);

create table tbl_part_time(
    id bigint auto_increment primary key,
    time time not null,
    conference_room_id bigint not null,
    constraint fk_part_time_conference_room foreign key(conference_room_id)
                                references tbl_conference_room(id)
);

create table tbl_reservation(
    id bigint auto_increment primary key,
    time time not null,
    created_date datetime default (current_timestamp),
    client_email varchar(255) not null,
    conference_room_id bigint not null,
    constraint fk_reservation_client foreign key (client_email)
                            references tbl_client(email),
    constraint fk_reservation_conference_room foreign key (conference_room_id)
                            references tbl_conference_room(id)
);

show tables;
select * from tbl_client;
select * from tbl_office;
select * from tbl_conference_room;
select * from tbl_reservation;