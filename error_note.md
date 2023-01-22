230122
table>thead>(th*7)>tbody(th+td*5+th)*4

이렇게 하면 thead가 첨부터 끝까지 포함하게 됨

230112 파이썬
return 은 함수가 실행되고 나서 " ~을 남겨주세요" 라는 의미

print는 말 그대로 그냥 출력하란 의미 

함수의 괄호 () 안에 들어가는 것은 내가 함수에 집어넣을 것들을 뭐라고 부를 것인가에 대한 선언을 하는 것이다. 

def lia(heart)

함수는 리아 함수에 heart를 집어 넣겠다, heart라는 것을 집어 넣겠다는 선언.

def order (shot=2, size='Regular', takeout=True): 
  print(f'아메리카노{size} 사이즈 {shot} 샷)
  if takeout
         print ('포장 주문이 완료되었습니다')
       else:
         print('주문이 완료되었습니다')

order('Regular', takeout=True) 이렇게 하면, 키워드가 설정 안되었기 때문에 Regular가 shot에 해당이 된다. 그래서 오류 뜸.




