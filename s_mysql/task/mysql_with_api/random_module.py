import random as r

# randint(시작값, 끝값)
# 1 ~ 10 까지 중 랜덛한 값 1개
# print(r.randint (1, 10))
#
#
# #

#확률 선언
# 단위 = 10
# 단위_dict = {1: 100, 10 : 10}
# ratting = [0]* 단위_dict[단위]
# 확률 = 30
#
# #2 확률을 계산해서 해당 자리에 1 대입
# for i in range(확률 // 10):
#     ratting[i] = 1
#
# #3 10 개 중 1은 3개 있기 때문에, 1이 나올 확률은 30%이다.
# if ratting[r.randint(0, len(ratting))] == 1:
#     print('강화 성공')
def random_module():
    randnum =[]
    for i in range(6):
        ran = r.randint(0,9)
        randnum.append(str(ran))
    print(randnum)

    randnum = "".join(randnum)
    return randnum
# print(randnum)
