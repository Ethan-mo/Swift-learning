//Test1
func printName(firstName:String, lastName:String?){
    //if let
    if let lName = lastName { // 옵셔널 변수가 값이 있다면 언래핑
        print(lName,firstName)
    }
    else{
        print("성이 없네요")
    }

    //guard let
    guard let lName = lastName else{ //옵셔널 변수가 값이 없다면
        print("성이 없네요!")
        return
    }
}
printName(firstName: "길동", lastName: "홍")
//Test2
func multiplyByTen(value: Int?){
    guard let number = value, number < 10 else { // 조건식이 거짓일 때 실행
        print("수가 10보다 크다")
        return
    }
    print(number*10) //조건식이 참일 때 실행, 주의 : number를 여기서도 사용 가능
}
multiplyByTen(value: 3) //30

//Test3 guard문 만들기
func Testfuc(a:Int?){
    guard let b = a, b > 10 else{
        print("10보다 크지 않습니다")
        return
    }
    print(a)
}
Testfuc(a: 8)
//Test4 switch-case문에서 where절 사용하기
func game(info1:Int,info2:Int){
    
    switch (info1){
    case 0...19 where info2 > 50:
        print("마나는 충분해! 체력은 부족하네?")
    case 20...60 where info2 > 50:
        print("마나와 체력은 충분해 보이는데?")
    case 61...100 where info2 > 50:
        print("거의 풀피야!")
    default:
        print("마나가 부족해!")
    }
}
game(info1:21,info2:60)

//Test5 fallthrough문 사용하기
var value = 4
switch(value) {
case 4:
    print("4")
    fallthrough
case 3:
    print("3")
    fallthrough
case 2:
    print("2")
    fallthrough
default:
    print("1")
}

//Test6 SWIFT에서의 함수
func 반환값은정수(A:Int?,B:Int?) -> Int {
    return A! + B!
}
print(반환값은정수(A: 15, B: 17))
