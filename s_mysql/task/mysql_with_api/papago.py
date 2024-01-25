# client_id : lnDWG60ZRc6QPHHM5UHM
# client_secret : Nr8vbKtW58
# https://openapi.naver.com/v1/papago/n2mt

import urllib.request # 깨지지 말라고 한번 덧씌워주는 용도
import json

def papago(text):
    client_id = "lnDWG60ZRc6QPHHM5UHM"
    client_secret = "Nr8vbKtW58"
    encoding_text = urllib.parse.quote(text)
    data = f"source=ko&target=en&text={encoding_text}" # 한국어를 영어로
    url = "https://openapi.naver.com/v1/papago/n2mt"
    request = urllib.request.Request(url)

    # -H
    request.add_header("X-Naver-Client-Id", client_id)
    request.add_header("X-Naver-Client-Secret", client_secret)
    response = urllib.request.urlopen(request, data=data.encode("utf-8"))
    rescode = response.getcode()

    if rescode == 200:
        response = json.loads(response.read().decode("utf-8"))
        print(response['message']['result']['translatedText'])

    return response['message']['result']['translatedText']