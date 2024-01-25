show databases;
use test;

create table tbl_member(
    member_name varchar(255),
    member_age int
);

show tables;

drop table tbl_member;

/*
    자동차 테이블 생성
    1. 자동차 번호
    2. 자동차 브랜드
    3. 출시 날짜
    4. 색상
    5. 가격

*/

create table car(
    car_number bigint primary key,
    car_brand varchar(255),
    car_date date,
    car_color varchar(255),
    car_price int
);

drop table car;

/*
    동물 테이블 생성
    1. 번호
    2. 종류
    3. 먹이
*/

create table animal(
    number bigint primary key,
    kind varchar(255) not null unique,
    feed varchar(255)
);

drop table animal;

/*
    회원		     주문		상품
	---------------------------------------------------------
	번호PK		번호PK		번호PK
	---------------------------------------------------------
	아이디U, NN	날짜NN		이름NN
	비밀번호	NN	회원번호FK, NN	가격D=0
	이름NN		상품번호FK, NN	재고D=0
	주소NN
	이메일
	생일
*/

create table tbl_user(
    id bigint primary key,
    user_id varchar(255) not null,
    password varchar(255) not null,
    name varchar(255) not null,
    address varchar(255) not null,
    email varchar(255),
    birth date
);

create table tbl_product(
    id bigint primary key,
    name varchar(255) not null,
    price int default 0,
    stock int default 0
);

create table tbl_order(
    id bigint primary key,
    order_date datetime default current_timestamp,
    user_id bigint,
    product_id bigint,
    constraint fk_order_user foreign key(user_id)
    references tbl_user(id),
    constraint fk_order_product foreign key(product_id)
    references tbl_product(id)
);

/*
    1. 요구사항 분석
        꽃 테이블과 화분 테이블 2개가 필요하고,
        꽃을 구매할 때 화분도 같이 구매합니다.
        꽃은 이름과 색상, 가격이 있고,
        화분은 제품번호, 색상, 모양이 있습니다.
        화분은 모든 꽃을 담을 수 없고 정해진 꽃을 담아야 합니다.

    2. 개념 모델링
        꽃                화분
        -----------------------------
        번호              번호
        -----------------------------
        이름              제품번호
        색상              색상
        가격              모양
                         꽃번호

    3. 논리 모델링
        꽃               화분
        ---------------------
        번호PK            번호PK
        ---------------------------
        이름 NN           제품번호 NN
        색상 NN           색상 NN
        가겨 NN           모양 NN
        화분제품 FK, NN   꽃번호 FK, NN



    4. 물리 모델링
        tbl flower
        -----------
        id: bigint primary key
        ----------------------
        name varchar(255) not null
        color varchar(255) not null
        price int
        pot_id foreign key not null
        ------------------------

        tbl pot
        ------------------
        id bigint primary key
        --------------------
        pot_id varchar(255) not null
        pot_color varchar(255) not null
        pot_shape varchar(255) not null
        flower_id foreign key not null

    5. 구현
*/

create table tbl_flower(
    id bigint primary key,
    name varchar(255) not null,
    color varchar(255) not null,
    price int default 0,
    pot_id bigint not null

);

create table tbl_pot(
    id bigint primary key,
    pot_id varchar(255) not null,
    pot_color varchar(255) not null,
    pot_shape varchar(255) not null,
    flower_id bigint,
    constraint fk_flower_pot foreign key(flower_id)
    references tbl_flower(id)
);

alter table tbl_flower add constraint fk_pot_flower foreign key (pot_id) references tbl_pot(id);
drop table tbl_flower, tbl_pot;
show tables;

/*
    복합키(조합키) : 하나의 PK에 여러 컬럼을 설정한다.
*/

create table tbl_flower1(

    name varchar(255) not null,
    color varchar(255) not null,
    price int default 0,
    primary key(name, color)

);

create table tbl_pot1(
    id bigint primary key,
    pot_id varchar(255) not null,
    pot_color varchar(255) not null,
    pot_shape varchar(255) not null,
    flower_name varchar(255) not null,
    flower_color varchar(255) not null,
    constraint fk_flower_pot1 foreign key(flower_name, flower_color)
    references tbl_flower1(name,color)
);

show tables;
