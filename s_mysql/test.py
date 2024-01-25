import random as r

range = 10
range_dict = {1:100, 10 : 10}
ratting  = [0]*range_dict[range]
percent = 30

for i in range(percent // 10):
    ratting[i] = 1

if ratting[r.randint(0, len(ratting))] == 1:
    print('강화성공')


def check(*, key: str, value: str) -> dict:
    # 저장소(DB)에서 각 은행 정보를 가져온 뒤
    for bank in Bank.banks:
        # 각 은행에서 회원의 정보를 가져온다.
        for user in bank:
            # 전달받은 키워드(key)로 회원의 정보가 value와 같은 지 검사한다.
            if user[key] == value:
                # 만약 해당 회원을 찾았다면, 회원의 전체 정보를 리턴한다.
                return user
    # 해당 회원을 찾지 못했다면, None을 리턴한다.
    return None
