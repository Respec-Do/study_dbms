create table tbl_parent(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    age tinyint default 1,
    gender varchar(255) not null,
    address varchar(255) not null,
    phone varchar(255) not null,
    constraint check_gender check ( gender in ('선택안함', '여자', '남자') )
);

create table tbl_child(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    age tinyint default 1,
    gender varchar(255) not null,
    parent_id bigint not null,
    constraint check_child_gender check ( gender in ('선택안함', '여자', '남자') ),
    constraint fk_child_parent foreign key (parent_id)
                      references tbl_parent(id)
);

create table tbl_field_trip(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    count tinyint default 0
);

create table tbl_file(
    /* 슈퍼키 */
    id bigint auto_increment primary key,
    file_path varchar(255) not null,
    file_name varchar(255) not null
);

create table tbl_field_trip_file(
    /* 서브키 */
    id bigint primary key,
    field_trip_id bigint not null,
    constraint fk_field_trip_file_file foreign key (id)
    references tbl_file(id),
    constraint fk_field_trip_file_field_trip foreign key (field_trip_id)
    references tbl_field_trip(id)
);

create table tbl_apply(
    id bigint auto_increment primary key,
    child_id bigint not null,
    field_trip_id bigint not null,
    constraint fk_apply_child foreign key (child_id)
    references tbl_child(id),
    constraint fk_apply_field_trip foreign key (field_trip_id)
    references tbl_field_trip(id)
);

create table tbl_owner(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    age int default 0,
    phone varchar(255) not null,
    address varchar(255) not null
);


create table tbl_pet(
    id bigint auto_increment primary key,
    name varchar(255) default '사랑',
    ill_name varchar(255) not null,
    age int default 0,
    weight decimal(3, 2) default 0.0,
    owner_id bigint,
    constraint fk_pet_owner foreign key(owner_id)
                references tbl_owner(id)
);


show tables;
select * from tbl_owner;
select * from tbl_pet;
drop table tbl_owner, tbl_pet;