# Python Practice - Utube https://www.youtube.com/watch?v=kWiCuklohdY&list=PLMsa_0kAjjrd8hYYCwbAuDsXZmHpqHvlV



# Quiz 5 당신은 cocoa 서비스를 이용하는 택시 기사다.
# 50명의 승객과 매칭 기회가 있을 때, 총 탑승 승객 수를 구하는 프로그램을 작성해라

# 조건1 : 승객별 운행 소요 시간은 5분 ~ 50분 사이의 난수로 정해진다.
# 조건2 : 당신은 소요 시간 5분 ~ 15분 사이의 승객만 매칭해야 한다.


from random import * # 난수 있으니 random 모듈을 쓴다.
cnt = 0 # 총 탑승 승객 수 
for i in range(1, 51): # 1에서 50이라는 수(승객)
    time = randrange(5, 51) # 5분 ~ 50분 사이의 소요 시간 / randrange = 
    if 5 <= time <= 15: # 5분 ~ 15분 이내의 손님(매칭 성공), 탑승 수 증가 처리
        print("[0] {0}번째 손님 (소요 시간 : {1}분" .format(i, time))
        cnt += 1
    else: # 매칭 실패한 경우라 cnt 값을 안적는다
        print("[ ] {0}번째 손님 (소요 시간 : {1} 분".format(i, time))

print("총 탑승 승객 : {0}분" .format(cnt))

