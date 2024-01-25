# https://ocr.space/OCRAPI
# K81787531788957
# https://api.ocr.space/parse/imageurl?apikey=&url=
# https://api.ocr.space/parse/imageurl?apikey=&url=&language=&isOverlayRequired=true

import requests

def ocr(upload_image):
    url = f'https://api.ocr.space/parse/imageurl?apikey=K81787531788957&url={upload_image}&language=kor&isOverlayRequired=true'
    response = requests.get(url) # request로 url을 받아오게됨
    response.raise_for_status()
    result = response.json()
    print(result) # 리턴값임.(결과값), dictionary 타입으로 받아옴
    print(result['ParsedResults'][0]['ParsedText'])
    return result['ParsedResults'][0]['ParsedText']