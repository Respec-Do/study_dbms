# 숙제

# 회원가입
# 회사 추가
# 회의실 추가
# 회의실마다 이용가능 시간 추가
# 예약 추가
# 회의실 전체 내용 조회(예약이 이미 완료된 회의실 시간은 보여지지 않는다).

from crud_module import *
from connection_module import *
import hashlib


#
# if __name__ == '__main__':
#     # 회원가입
#     message = "이메일: "
#     client_email = input(message)
#     ## 아이디 중복검사
#     find_by_id_query = "select * from tbl_client where email = %s"
#     find_by_id_params = client_email,
#     result = find_by_id(find_by_id_query, find_by_id_params)
#
#     if not result:
#         message = "비밀번호: "
#         client_password = input(message)
#         encryption = hashlib.sha256()
#         encryption.update(client_password.encode('utf-8'))
#         client_password =  encryption.hexdigest()
#
#         message = "이름: "
#         client_name = input(message)
#
#         save_query = "insert into tbl_client(email, password, name) values(%s, %s, %s)"
#         save_params = (client_email, client_password, client_name)
#         save(save_query, save_params)
#         print(f"{client_name}님 환영합니다~!")
#
#     else:
#         print("이미 사용중인 이메일입니다.")
#
    # 회사 추가
    # save_many_query = "insert into tbl_office(name, location) \
    #                    values(%s, %s)"
    # save_many_params = (
    #     ('네이버','서울시 역삼동'),
    #     ('코리아IT','서울시 서초동'),
    #     ('KAKAO','경기도 의정부시')
    # )
    # save_many(save_many_query, save_many_params)

# # 회의실 추가
# find_by_id_query = "select id from tbl_office where id = %s"
# # find_by_id_params = 1,
# # find_by_id_params = 2,
# find_by_id_params = 3,
# office = find_by_id(find_by_id_query, find_by_id_params)
# # print(office)
# office_id = office.get("id")
# save_many_query = "insert into tbl_conference_room(office_id) \
#                    values(%s)"
# save_many_params = (
#     (office_id),
#     (office_id),
#     (office_id),
# )
# save_many(save_many_query, save_many_params)

# 회의실마다 이용가능 시간 추가
# find_by_id_query = "select id from tbl_conference_room where id = %s"
# find_by_id_params = 1,
# find_by_id_params = 2,
# find_by_id_params = 3,
# find_by_id_params = 4,
# find_by_id_params = 5,
# find_by_id_params = 6,
# find_by_id_params = 7,
# find_by_id_params = 8,
# find_by_id_params = 9,
# find_by_id_params = 10,
# find_by_id_params = 11,
# conference_room = find_by_id(find_by_id_query, find_by_id_params)
# conference_room_id = conference_room.get("id")
# print(conference_room_id)
# 이용가능 시간 추가
# update_query = "insert into tbl_part_time(time, conference_room_id) values (%s, %s)"
# update_params = [
    # ('08:00:00', conference_room_id),
    # ('09:00:00', conference_room_id),
    # ('10:00:00', conference_room_id),
    # ('11:00:00', conference_room_id),
    # ('12:00:00', conference_room_id),
    # ('13:00:00', conference_room_id),
    # ('14:00:00', conference_room_id),
    # ('15:00:00', conference_room_id),
    # ('16:00:00', conference_room_id),
    # ('17:00:00', conference_room_id),
    # ('18:00:00', conference_room_id),
# ]
#
# save_many(save_many_query, save_many_params)

#예약 추가
message = "이용할 회의실의 ID를 입력하세요: "
conference_room_id = int(input(message))

# 예약 가능한 시간대 출력
get_available_times_query = "select time from tbl_part_time where conference_room_id = %s"
get_available_times_params = (conference_room_id,)
available_times = find_all_by(get_available_times_query, get_available_times_params)

print("이용 가능한 시간대:")
for time in available_times:
    print(time['time'])

# 사용자로부터 선택한 시간 입력
message = "예약할 시간을 선택하세요 (HH:MM:SS): "
reservation_time = input(message)

# 사용자로부터 이메일 입력
message = "예약자 이메일을 입력하세요: "
client_email = input(message)

# 예약 추가 쿼리
add_reservation_query = "insert into tbl_reservation(time, client_email, conference_room_id) values (%s, %s, %s)"
add_reservation_params = (reservation_time, client_email, conference_room_id)
save(add_reservation_query, add_reservation_params)

print(f"{reservation_time}에 예약이 완료되었습니다.")

# 회의실 전체 내용 조회(예약이 이미 완료된 회의실 시간은 보여지지 않는다).























