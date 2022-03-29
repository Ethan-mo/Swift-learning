//Test1

import UIKit
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
    case 0..<20 where info2 > 50:
        print("마나는 충분해! 체력은 부족하네?")
    case 20..<60 where info2 > 50:
        print("마나와 체력은 충분해 보이는데?")
    case 60..<100 where info2 > 50:
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
print(type(of: 반환값은정수))

//Test7 Swift함수 실습
//* 일반적인 함수의 모습
func add(x: Int, y: Int) -> Int {
    return(x+y)
}
print(add(x: 10, y: 20))

//*
func add(first x: Int,second y: Int) -> Int{
    return(x+y)
}
print(add(x: 10, y: 20))

func add(_ x: Int,_ y: Int) -> Int{
    return(x+y)
}
print(add(x: 10, y: 20))

func add(_ x: Int,with y: Int) -> Int{
    return(x+y)
}
print(add(x: 10, y: 20))

//Test8 C/C++함수를 Swift함수로 변경
func ddd(계산할값 x:Int) -> Int{
    return(x*2)
}
func setX(계산할값 x:Int){
    var xx : Int
    xx = x
}
func getX() -> Int{
    var x : Int = 10
    return(x)
}
func addd(x:Int,y:Int) -> Int{
    return(x+y)
}
func setXY(x:Int,y:Int){
    var xx :Int
    var yy :Int
    xx = x
    yy = y
}
print(ddd(계산할값: 10))
print(setX(계산할값: 15))
print(getX())
print(addd(x: 15, y: 16))
print(setXY(x: 15, y: 25))

//Test9 : BMI판정결과를 리턴하는 calcBMI()함수를 정의
import Foundation
func calcBMI(몸무게 weight : Double,키 height : Double) -> String{
    var bmi = weight / (height * height * 0.0001)
    switch(bmi){
    case 0..<18.5:
        return("저체중")
    case 18.5..<25:
        return("정상")
    case 25..<30:
        return("1단계 비만")
    case 30..<40:
        return("2단계 비만")
    default:
        return("3단계 비만")
    }
}
print(calcBMI(몸무게: 60.0, 키: 170.0)) //BMI:20.8, 판정 : 정상
