def open_account():   # 설정 / 함수 이름
    print("새로운 계좌가 생성되었습니다.")  # 함수는 호출해줘야 출력된다 -> open으로도 출력 할 수 있음



def deposit(balance, money): # 3. 아래의 0원과 1000원을 받아서 
    print("입금이 완료되었습니다. 잔액은 {}원입니다." .format(balance + money)) # 4. 위의 0원과 1000원을 받아서 더해줌.
    return balance + money # 5. 총 금액을 return을 통해 반환해준다.
def withdraw(balance, money): # 출금
    if balance >= money: # 잔액이 출금보다 많은 경우
        print("출금이 완료되었습니다. 잔약은 {0}원입니다.".format(balance - money))
        return balance - money 
    else:
        print("출금이 완료되지 않았습니다. 잔액은 {0}원입니다.".format(balance))
        return balance
def withdraw_night(balance, money): # 저녁에 출금
    commission = 100 # 수수료 100원
    return commission, balance - money - commission  # 수수료가 총 얼마가 나왔고, 그래서 현재 잔액 중에서 얼마를 출금하고 거기다가 수수료까지 뺀 금액을 튜플 형식으로 보내주는 것. / 이전에는 return에 하나의 값만 보내왔다면 이번에는 두 개의 값을 콤마를 통해 구분해서 반환해준다. 
balance = 0 # 1. 잔액 = 0         /     # 6. 위의 return을 통해서 반환된 금액을 다시 balance에 저장한다.
balance = deposit(balance, 1000) # 2. 입금하는 함수를 호출을 하면서, 현재 잔액인 0원과 1000원을 집어넣는다. 그럼 위의 함수로 들어가게 된다. 
# balance = withdraw(balance, 2000)
# print(balance)
commission, balance = withdraw_night(balance, 500) 
print("수수료 {0} 원이며, 잔액은 {1} 원입니다.".format(commission, balance))