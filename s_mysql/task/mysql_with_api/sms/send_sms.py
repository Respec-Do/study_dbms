import json
import message

# 한번 요청으로 1만건의 메시지 발송이 가능합니다.
if __name__ == '__main__':
    data = {
        'messages': [
            {
                'to': '01033901696',
                'from': '01033901696',
                'text': '테스트문자'

            }
            # ...
            # 1만건까지 추가 가능
        ]
    }
    res = message.send_many(data)
    print(json.dumps(res.json(), indent=2, ensure_ascii=False))
