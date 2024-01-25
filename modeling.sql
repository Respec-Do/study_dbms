/*
    1. 요구사항 분석
        안녕하세요, 동물병원을 곧 개원합니다.
        동물은 보호자랑 항상 같이 옵니다. 가끔 보호소에서 오는 동물도 있습니다.
        보호자가 여러 마리의 동물을 데리고 올 수 있습니다.
        보호자는 이름, 나이, 전화번호, 주소가 필요하고
        동물은 병명, 이름, 나이, 몸무게가 필요합니다.

    2. 개념모델링

        보호자         동물          동물병원
        -------------------------------------
        번호          번호
        --------------------------------------
        이름          병명          보호자번호,
        나이          이름          동물번호
        전화번호       나이
        주소          몸무게
        동물번호


    3. 논리모델링

        보호자         동물          동물병원
        --------------------------------------
        번호PK        번호PK        보호자번호FK, 동물번호FK
        -------------------------------------------------
        이름 NN       병명 NN
        나이 D=0      이름 NN
        전화번호 NN    나이 D=0
        주소 NN       몸무게 D=0
                      보호자번호 FK NN
    4. 물리모델링

        tbl_human                   tbl_animal                      tbl_hospital
        ----------------------------------------------------------------------------
        id: bigint primary key      id: bigint primary key          human_id FK, animal_id FK
        ------------------------------------------------------------------------------
        name: varchar(255) not null disease: varchar(255) not null
        age: varchar(255) default 0 name: varchar(255) not null
        phone: varchar(255) not null age: varchar(255) not null
        address: varchar(255) not null weight: varchar(255) default 0


    5. 구현
*/

show tables;
drop table tbl_user, tbl_pot, tbl_pot1, tbl_order, tbl_flower, tbl_flower1, tbl_product


create table tbl_human(
    id bigint primary key,
    human_name varchar(255) not null,
    human_age int default 0,
    phone varchar(255) not null,
    address varchar(255) not null
);


create table tbl_animal(
    id bigint primary key,
    animal_name varchar(255) default '사랑',
    ill_name varchar(255) not null,
    animal_age int default 0,
    weight decimal(3, 2) default 0.0,
    owner_id bigint,
    constraint fk_pet_owner foreign key (owner_id)
    references tbl_human(id)
);


drop table tbl_animal, tbl_human;
show tables;

/*
    1. 요구사항 분석
        안녕하세요 중고차 딜러입니다.
        이번에 자동차와 차주를 관리하고자 방문했습니다.
        자동차는 여러 명의 차주로 히스토리에 남아야 하고,
        차주는 여러 대의 자동차를 소유할 수 있습니다.
        그래서 우리는 항상 등록증(Registration)을 작성합니다.
        자동차는 브랜드, 모델명, 가격, 출시날짜가 필요하고
        차주는 이름, 전화번호, 주소가 필요합니다.

    2. 개념 모델링

        차주          등록증             차
        ------------------------------------------
        번호          등록증번호        번호
        -------------------------------------------
        이름          차주번호          브랜드
        전화번호       차번호           모델명
        주소                           가격
                                      출시날짜


    3. 논리 모델링

        차주          등록증            차
        ------------------------------------------------
        번호PK        등록증번호PK      번호PK
        -------------------------------------------
        이름NN          차주번호FK,NN   브랜드NN
        전화번호NN       차번호FK,NN    모델명 NN
        주소NN                         가격 NN
                                      출시날짜 NN

    4. 물리 모델링

        tbl_user
        ------------------
        id : bigint primary key
        -----------------------
        name varchar(255) not null
        phone varchar(255) not null
        address varchar(255) not null

        tbl_car
        ------------------------
        id : bigint primary key
        -------------------------
        brand varchar(255) not null
        model varchar(255) not null
        price int default 0
        release_date date not null

        tbl_registration
        -----------------------------
        id bigint primary key
        --------------------------
        user_id FK
        car_id FK

    5. 구현

*/
/*
create table tbl_user(
    id bigint primary key,
    name varchar(255) not null,
    phone varchar(255) not null,
    address varchar(255) not null
);

create table tbl_car(
    id bigint primary key,
    brand varchar(255) not null,
    model varchar(255) not null,
    price int default 0,
    release_date date not null

);


create table tbl_registration(
    id bigint primary key,
    user_id bigint,
    car_id bigint,
    constraint fk_user_registration foreign key (user_id)
                             references tbl_user(id),
    constraint fk_car_registration foreign key (car_id)
                             references tbl_car(id)

);



show tables;
drop table tbl_car, tbl_registration, tbl_user
*/

/*
    요구 사항
    커뮤니티 게시판을 만들고 싶어요.
    게시판에는 게시글 제목과 게시글 내용, 작성한 시간, 작성자가 있고,
    게시글에는 댓글이 있어서 댓글 내용들이 나와야 해요.
    작성자는 회원(TBL_USER)정보를 그대로 사용해요.
    댓글에도 작성자가 필요해요.


    개념적 모델링
    게시글           댓글          회원
    ----------------------------------
    번호PK           번호PK        번호PK
    ----------------------------------
    게시글제목       댓글내용         이름
    게시글내용       작성자FK         나이
    작성한시간
    작성자FK
    댓글FK


    물리적 모델링
    tbl_post
    -----------
    id bigint primary key
    --------------------
    post_title varchar(255) not null
    post_content varchar(255) not null
    post_date date
    user FK TBL_USER
    comment FK

    tbl_comment
    --------------------
    id bigint primary key
    ----------------------
    comment_content varchar(255) not null
    user FK TBL_USER

    tbl_user
    -----------------
    id bigint primary key
    ------------------------
    name varchar(255) not null
    age int default 0

*/
/*


create table tbl_post(
    id bigint primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    date date default (current_date),
    user bigint,
    constraint fk_user_post foreign key (user)
                     references tbl_user(id),
    comment bigint,
    constraint fk_comment_post foreign key (comment)
                     references tbl_comment(id)

);

create table tbl_comment(
    id bigint primary key,
    content varchar(255) not null,
    user bigint,
    constraint fk_user_comment foreign key (user)
                        references tbl_user(id)
);

create table tbl_user(
    id bigint primary key,
    name varchar(255) not null,
    age int default 0
);
*/
drop table tbl_user, tbl_comment, tbl_post
show tables;
/*
create table tbl_user(
    id bigint primary key,
    user_id varchar(255) not null unique,
    password varchar(255) not null,
    name varchar(255) not null,
    address varchar(255) not null,
    email varchar(255),
    birth date
);

create table tbl_post(
    id bigint primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    create_date datetime default current_timestamp,
    user_id bigint not null,
    constraint fk_post_user foreign key(user_id)
                     references tbl_user(id)
);

create table tbl_reply(
    id bigint primary key,
    content varchar(255) not null,
    user_id bigint not null,
    post_id bigint not null,
    constraint fk_reply_user foreign key(user_id)
                     references tbl_user(id),
    constraint fk_reply_post foreign key(post_id)
                     references tbl_post(id)
);

drop table tbl_reply;
drop table tbl_post;
drop table tbl_user;

show tables;
*/
/*
    요구사항

    마이페이지에서 회원 프로필을 구현하고 싶습니다.
    회원당 프로필을 여러 개 설정할 수 있고,
    대표 이미지로 선택된 프로필만 화면에 보여주고 싶습니다.
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

create table tbl_mypage(
    id bigint primary key,
    main_profile bigint,
    constraint fk_profile_mypage foreign key (main_profile)
                       references tbl_profile(id)
);

create table tbl_profile(
    id bigint primary key,
    file_path varchar(255) default '/upload/',
    file_name varchar(255),
    is_main varchar(255) default 'ELSE',
    user_id bigint,
    constraint fk_file_user foreign key (user_id)
                        references tbl_user(id)
);

drop table tbl_profile, tbl_user;
show tables;




/*
    요구사항

    학사 관리 시스템에 학생과 교수, 과목을 관리합니다.
    학생은 학번, 이름, 전공 학년이 필요하고
    교수는 교수번호, 이름, 전공, 직위가 필요합니다.
    과목은 고유한 과목 번호와 과목명, 학점이 필요합니다.
    학생은 여러 과목을 수강할 수 있으며,
    교수는 여러 과목을 강의할 수 있습니다.
    학생이 수강한 과목은 성적이 모두 기록됩니다.

*/

create table tbl_student(
    id bigint primary key,
    student_id int not null,
    student_name varchar(255) not null,
    student_grade decimal (1,1) default 0.0,
    student_subject bigint,
    constraint fk_subject_student foreign key (student_subject)
                        references tbl_subject(id)
);

create table tbl_professor(
    id bigint primary key,
    professor_id int not null,
    professor_name varchar(255) not null,
    professor_major varchar(255) not null,
    professorship varchar(255) not null,
    professor_subject bigint,
    constraint fk_subject_professor foreign key (professor_subject)
                          references tbl_subject(id)
);

create table tbl_subject(
    id bigint primary key,
    subject_id int not null,
    subject_title varchar(255) not null,
    subject_score decimal (1,1) default 0.0
);
show tables;
drop table tbl_subject, tbl_professor, tbl_student


/*
    개념모델링
    대카테고리   소카테고리
    ----------------------
    번호        번호
    이름        대카테고리참조번호
                이름
    논리모델링
    대카테고리   소카테고리
    ----------------------
    번호PK        번호PK
    이름 NN        대카테고리참조번호FK
                 이름 NN


    물리모델링
    tbl_bigcategory
    -------------------
    id bigint primary key
    name varchar(255) not null

    tbl_smallcategory
    ---------------------
    id bigint primary key
    name varchar(255) not null
    bigcategory_id FK

*/

show databases;
use test;

create table tbl_bigcategory(
    id bigint primary key,
    name varchar(255) not null
);

create table tbl_smallcategory(
    id bigint primary key,
    name varchar(255) not null,
    bigcategory_id bigint,
    constraint fk_small_big foreign key (bigcategory_id) references tbl_bigcategory(id)
);

show tables;
show databases;
use test;

/*
    회의실 예약 서비스

    개념 모델링
    회원      사무실     회의실          예약시스템
    -------------------------------------------
    번호      번호                        번호
    --------------------------------------------
    이름      이름      이름              회원번호
    등급               예약시작시간        회의실이름
                       예약종료시간       예약시작시간
                      사무실번호         예약종료시간

    논리 모델링
    회원              사무실             회의실                                 예약시스템
    ----------------------------------------------------------------------------
    번호PK            번호PK            이름PK,예약시작시간PK,예약종료시간PK       번호PK
    --------------------------------------------------------------------------------------
    이름NN            이름NN            사무실번호FK                            회원번호FK
    등급NN                                                                    회의실이름FK
                                                                             예약시작시간FK
                                                                             예약종료시간FK


    물리모델링

    tbl_member
    ------------------
    id bigint primary key
    ----------------------
    name varchar(255) not null
    membershipgrade varchar(255) not null


    tbl_office
    ---------------
    id bigint primary key
    ---------------------------
    name varchar(255) not null


    tbl_meetingroom
    ------------------------
    name varchar(255) not null
    start_time time not null
    end_time time not null
    primary key(name, start_time, end_time)
    office_id FK

    tbl_reservation_system
    ------------------------------
    id bigint primary key
    --------------------------------
    member_id bigint FK
    room_name varchar(255) not null FK
    start_time time not null FK
    end_time time not null FK

*/


create table tbl_member(
    member_id bigint primary key,
    name varchar(255) not null,
    memvership varchar(255) not null
);

create table tbl_office(
    office_id bigint primary key,
    office_name varchar(255) not null
);

create table tbl_meeting_room(

    room_name varchar(255) not null,
    start_time time not null,
    end_time time not null,

    office_id bigint,
    primary key(room_name, start_time, end_time),
    constraint fk_office_meeting foreign key (office_id) references tbl_office(office_id)

);

create table tbl_reservation(
    reservation_id bigint primary key,
    member_id bigint,
    room_name varchar(255) not null,
    start_time_id time not null,
    end_time_id time not null,
    constraint fk_user_reservation foreign key(member_id) references tbl_member(member_id),
    constraint fk_meeting_room_reservation foreign key(room_name, start_time_id, end_time_id)
        references tbl_meeting_room(room_name, start_time, end_time)
);
show tables;
drop table tbl_meeting_room, tbl_member, tbl_office;

/*
    체험학습

    개념모델링


    학부모         아이          체험학습
    -------------------------------------
    번호          번호          번호
    -------------------------------------
    이름          이름          제목
    나이          나이          내용
    주소          성별          이미지
    전화번호       부모번호      아이번호
    성별


    논리모델링

    학부모                     아이                      체험학습
    --------------------------------------------------------------
    번호PK                    번호PK                    번호PK
    --------------------------------------------------------------
    이름NN                    이름NN                    제목NN
    나이NN                    나이NN                    내용NN
    주소NN                    성별NN                    이미지NN
    전화번호NN                 부모번호FK                아이번호FK
    성별NN


    물리모델링

    tbl_parent
    -----------------
    id bigint primary key
    ---------------------
    name varchar(255) not null
    age int default 0
    address varchar(255) not null
    phone varchar(255) not null
    gender varchar(255) not null


    tbl_child
    ------------------------
    id bigint primary key
    --------------------------
    name varchar(255) not null
    age int default 0
    gender varchar(255) not null
    parent_id bigint FK


    tbl_field_study
    ---------------------
    id bigint primary key
    ------------------------
    title varchar(255) not null
    content varchar(255) not null
    image_path varchar(255) default '/upload/'
    image_name varchar(255) not null
    child_id bigint FK

*/

create table tbl_parent(
    id bigint primary key,
    name varchar(255) not null,
    age int default 0,
    address varchar(255) not null,
    phone varchar(255) not null,
    gender varchar(255) not null
);

create table tbl_child(
    id bigint primary key,
    name varchar(255) not null,
    age int default 0,
    gender varchar(255) not null,
    parent_id bigint,
    constraint fk_parent_child foreign key (parent_id) references tbl_parent(id)
);

create table tbl_field_study(
    id bigint primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    image_path varchar(255) default '/upload/',
    image_name varchar(255) not null,
    child_id bigint,
    constraint fk_child_study foreign key (child_id) references tbl_child(id)

);

show tables;

/*
    광고회사

    개념모델링

    기업                  카테고리                     광고             기업종류
    --------------------------------------------------------------------------
    번호                  번호                        번호             번호
    ----------------------------------------------------------------------------
    이름                  대카테고리                   제목              스타트업
    주소                  중카테고리                   내용              소기업
    대표번호               소카테고리                   기업번호          중견기업
    기업종류                                           카테고리          대기업


    논리모델링

    기업                  카테고리                     광고             기업종류
    --------------------------------------------------------
    번호PK                  번호PK                     번호PK             번호PK
    --------------------------------------------------------
    이름NN                대카테고리                   제목NN               스타트업
    주소NN                중카테고리                   내용NN                소기업
    대표번호NN             소카테고리                   기업번호FK           중견기업
    기업종류FK                                         카테고리FK           대기업



    물리모델링

    tbl_company
    --------------------
    id bigint primary key
    ---------------------
    name varchar(255) not null
    address varchar(255) not null
    head_major_phone varchar(255) not null
    kind bigint FK


    tbl_category
    --------------------
    id bigint primary key
    -----------------------
    major_category varchar(255) not null
    medium_category varchar(255) not null
    small_category varchar(255) not null


    tbl_kind
    ===================
    id bigint primary key
    --------------------------
    startup varchar(255) not null
    small varchar(255) not null
    medium varchar(255) not null
    major varchar(255) not null

    tbl_advertisement
    --------------------------
    id bigint primary key
    --------------------------
    title varchar(255) not null
    content varchar(255) not null
    company_id bigint FK
    category_id bigint FK
*/

create table tbl_company(
    id bigint primary key,
    name varchar(255) not null,
    address varchar(255) not null,
    head_major_phone varchar(255) not null,
    kind bigint,
    constraint fk_kind_company foreign key (kind) references tbl_kind(id)

);

create table tbl_category(
    id bigint primary key,
    major_category varchar(255) not null,
    medium_category varchar(255) not null,
    small_category varchar(255) not null
);

create table tbl_kind(
    id bigint primary key,
    startup varchar(255) not null,
    medium varchar(255) not null,
    major varchar(255) not null,
    small varchar(255) not null
);

create table tbl_advertisement(
    id bigint primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    company_id bigint,
    category_id bigint,
    constraint fk_company_advertisement foreign key (company_id) references tbl_company(id),
    constraint fk_category_advertisement foreign key (category_id) references tbl_category(id)
);

/*
    음료수 판매업체

    개념 모델링

    음료수             당첨자             당첨상품            배달상태
    ------------------------------------------------------------------
    번호PK
*/

create table tbl_beverage(
    id bigint primary key,
    name varchar(255) not null,
    winning_number int not null unique
);

create table tbl_winner(
    id bigint primary key,
    name varchar(255) not null,
    address varchar(255) not null
);

create table tbl_price(
    id bigint primary key,
    arrival_status bigint,
    beverage_id bigint,
    winner_id bigint,
    constraint fk_arrival_price foreign key (arrival_status) references tbl_arrival(id),
    constraint fk_beverage_price foreign key (beverage_id) references tbl_beverage(id),
    constraint fk_winner_price foreign key (winner_id) references tbl_winner(id)
);

create table tbl_arrival(
    id bigint primary key,
    shipping int default 0,
    completed int default 1
);


create table tbl_ecomous_company(
    id bigint primary key,
    name varchar(255) not null,
    addres varchar(255) not null,
    major_phone varchar(255) not null
);

create table tbl_user(
    id bigint primary key,
    name varchar(255) not null,
    address varchar(255) not null,
    phone varchar(255) not null,
    card_id bigint,
    constraint fk_card_user foreign key (card_id) references tbl_card(id)

);

create table tbl_product(
    id bigint primary key,
    name varchar(255) not null,
    price int default 0,
    stock int default 0
);

create table tbl_card(
    id bigint primary key,
    number varchar(255) not null,
    card_company varchar(255) not null

);

create table tbl_order(
    id bigint primary key,
    user_id bigint,
    company_id bigint,
    card_id bigint,
    product_id bigint,
    constraint fk_user_order foreign key (user_id) references tbl_user(id),
    constraint fk_company_order foreign key (company_id) references tbl_company(id),
    constraint fk_card_order foreign key (card_id) references tbl_card(id),
    constraint fk_product_order foreign key (product_id) references tbl_product(id)


);

show tables;

create table tbl_parent(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    age tinyint default 1,
    gender varchar(255) default '선택안함',
    address varchar(255) not null,
    phone varchar(255) not null,
    constraint check_gender check ( gender in ('선택안함', '여자', '남자') )
);
select id, name, age, gender, address, phone
from tbl_parent;

/*
    전체를 의미한 *은 직접 컬럼을 작성한 것보다 더 많은 연산이 필요학 ㅣ때문에
    대량의 데이터 조회시 사용을 지양한다.

    select * from tbl_parent;
*/

insert into tbl_parent
(name, age, address, phone)
values ('한동석','20','경기도 남양주','01012341234');

update tbl_parent
set age = 40
where id = 1;

delete from tbl_parent
where id = 1;

/*
    2명의 학부모 정보 추가,
    나이가 51세 이상인 부모의 이름 조회,
    경기도 남양주에 살고 있는 부모의 핸드폰 번호 조회,
    성별이 남자인 학부모를 선택안함으로 변경
    성별이 선택안함인 학부모를 모두 삭제
*/

insert into tbl_parent(name, age,gender, address, phone)
values ('cloe','24','여자','newyork','01012345678');

insert into tbl_parent(name, age, address, phone)
values ('김갑수','51','newyork','01048978888');

insert into tbl_parent(name, age, gender, address, phone)
values('신짱구','75','남자','서울 강남구','01055557888');

select name from tbl_parent where age >= 51;
select phone from tbl_parent where address = '경기도 남양주';
update tbl_parent set gender = '선택안함' where gender ='남자';
delete from tbl_parent where gender = '선택안함';

/*
    as(Alias): 별칭
*/

select id, name as 이름, age, gender, address, phone from tbl_parent;

/*
    concatenation(연결)
    concat([string1], [string2], ...)
*/

select concat('안녕하세요 제 이름은 ', name, '입니다.') from tbl_parent;

/*
    like
        포함된 문자열 값을 찾고, 문자의 개수에 제한도 줄 수 있다.


    예시)
    '%A': A로 끝나는 모든 값(SFDSA, FDSFDSA, ....)
    'A%': A로 시작하는 모든 값(ABC, Apple...)
    '%A%': A가 포함된 모든 값(jAva, FFFAF, ...)
*/

select id, name, age, gender, address, phone from tbl_parent
where address like '%남양%';
select id, name, age, gender, address, phone from tbl_parent
where address like '%new%';

/*
    핸드폰 번호에 5가 들어간 학부모 정보 전체 조회
    주소에 서울이 들어간 학부모 정보 전체 조회
*/

select id, name, age, gender, address, phone from tbl_parent
where phone like '%5%';

select id, name, age, gender, address, phone from tbl_parent
where address like '%서울%';

/*
    집계함수

    평균 avg()
    최대값 max()
    최소값 min()
    총 합 sum()
    개수 count()
*/

create table tbl_field_trip(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    content varchar(255) not null,
    count tinyint default 0
);

insert into tbl_field_trip (title, content, count)
values ('어서와 매미농장', '매미 잡자 어서와', 20);

insert into tbl_field_trip (title, content, count)
values ('아이스크림 빨리 먹기 대회', '아이스크림 누가 더 잘먹나', 100);

insert into tbl_field_trip (title, content, count)
values ('고구마 심기', '고구마가 왕 커요', 10);

insert into tbl_field_trip (title, content, count)
values ('숭어 얼음 낚시', '숭어 잡자 추워도 참아', 80);

insert into tbl_field_trip (title, content, count)
values ('커피 체험 공장', '커비 빈 객체화', 60);

insert into tbl_field_trip (title, content, count)
values ('치즈 제작하기', '여기 치즈 저기 치즈 전부 다 치즈', 5);

insert into tbl_field_trip (title, content, count)
values ('동물 타보기', '이리야!', 9);

select id, title, content, count from tbl_field_trip;

select sum(count) as total from tbl_field_trip;
select avg(count) as average from tbl_field_trip;
select max(count) as max_count from tbl_field_trip;
select min(count) as min_count from tbl_field_trip;
select round(avg(count), 2) as average from tbl_field_trip;
select count(id) as file_trip_count from tbl_field_trip;

/*
    order by: 정렬

    order by [컬럼명] asc: 오름차순, asc 생략가능
    order by [컬럼명] desc: 내림차순
*/

select id, title, content, count from tbl_field_trip

order by count desc;

select id, title, content, count from tbl_field_trip
order by count;

/*
    실행 순서
    1. from
    2. where
    3. select
    4. order by
*/

/*
    group by: ~별

    group by [컬럼명]
    having [조건식]

*/

create table tbl_order(
    id bigint auto_increment primary key,
    name varchar(255),
    price int default 0
);

insert into tbl_order (name, price)
values ('지우개', 3000);

insert into tbl_order (name, price)
values ('마우스', 5000);

insert into tbl_order (name, price)
values ('지우개', 3000);

insert into tbl_order (name, price)
values ('키보드', 15000);

insert into tbl_order (name, price)
values ('키보드', 15000);

insert into tbl_order (name, price)
values ('사과', 2000);

insert into tbl_order (name, price)
values ('사과', 2000);

insert into tbl_order (name, price)
values ('자두', 500);

insert into tbl_order (name, price)
values ('자두', 1000);

select name, count(name) total from tbl_order
                               /* 알리아스 를 사용하지 않고도 바로 total로 호출하는 것이 가능.*/
group by name;

/*
    주문된 상품별 평균 가격 조회
*/

select round(avg(price), 2) as average from tbl_order group by name;

/*주문된 상품별 평균 가격 중 5000원 이상인 상품만 조회*/

select round(avg(price), 2) as average from tbl_order
where avg(price) >= 500
group by name;


 /*where 절에서는 집계함수를 절대 쓸수없음*/
 /* 그럼 어떻게?? 해결방안은 having을 사용. */
 /*
    최종 실행 순서
    1. from
    2. where
    3. group by
    4. having
    5. select
    6. order by
*/

select round(avg(price), 2) as average from tbl_order
group by name
having avg(price) >= 5000;


/*
    서브 쿼리(Sub Query)

    from 절 : in line view
    select 절 : scalar
    where 절 : sub query

*/

/*
    상품별 가격 총 합과 전체 상품의 총 합 조회
*/

select name, sum(price) as total, (select sum(price) from tbl_order) from tbl_order
group by name;

/*
    상품 중 "우"가 들어간 상품별 총 합 조회
*/

select o.name, sum(o.price) from
(
    select name, price
    from tbl_order
    where name like '%우%'
) o
group by o.name;

select * from tbl_order;
show databases;
use test;

/*
    상품의 평균 가격이 1000원 이하의 상품의 개별 가격 조회
*/
select id, name, price from tbl_order
where name in
      /* 개수가 맞아야하기에 name or name or name 등으로 묶을때는 in을 사용해줌*/
(
       select name
       from tbl_order
       group by name
       having avg(price) <= 1000
);

/*
    최종 실행 순서
    1. from
    2. join
    3. on
    4. where
    5. group by
    6. having
    7. select
    8. order by
*/


