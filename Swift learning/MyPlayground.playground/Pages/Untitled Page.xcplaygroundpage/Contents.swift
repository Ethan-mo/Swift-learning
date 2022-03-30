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
    let 변수01 :Int
    let 변수02 :Int
    변수01 = x
    변수02 = y
}
print(ddd(계산할값: 10))
print(setX(계산할값: 15))
print(getX())
print(addd(x: 15, y: 16))
print(setXY(x: 15, y: 25))

//Test9 : BMI판정결과를 리턴하는 calcBMI()함수를 정의
import Foundation
func calcBMI(몸무게 weight : Double,키 height : Double) -> String{
    let bmi = weight / (height * height * 0.0001)
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

//Test10 : 디폴트 매개변수 정의하기
func sayHello(count: Int, name: String = "길동") -> String{
    return ("\(name), 너의 번호는\(count)")
}
var message1 = sayHello(count: 10, name: "소프트")
print(message1)
var message2 = sayHello(count: 100)
print(message2)

//Test11 : 함수로부터 여러 개의 결과 반환하기
func converter(length: Float) -> (yards: Float, centimeters: Float, meters: Float){
    let yards = length * 0.0277778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    return (yards, centimeters, meters)
}

var lengthTuple = converter(length:10) //변수 lengthTuple은 func converter()함수의 리턴값을 불러온다.
print(lengthTuple)
print(lengthTuple.yards)
print(lengthTuple.centimeters)
print(lengthTuple.meters)

//Test12 : 2개의 정수를 입력받아 가감제 리턴
func sss(x : Int, y : Int) -> (sum:Int,sub:Int,div:Double,com:Int,na:Int){
    let sum = x + y
    let sub = x - y
    let div = Double(x)/Double(y) // 같은 자료형만 연산 가능
    
    //과제
    let com = x * y
    let na = x % y
    return(sum, sub, div, com, na)
}
var result = sss(x:10, y:3)
print(result.sum)
print(result.sub)
print(String(format: "%.3f", result.div))
print(result.com)
print(result.na)
print(type(of: result))

//Test13 : 가변 매개변수
func displayStrings(문자열들: String...){
    for 문자열 in 문자열들{
        print(문자열)
    }
}

displayStrings(문자열들: "일", "이", "삼", "사")
displayStrings(문자열들: "one", "two")

//+ 추가 과제
func variadicAdd(합할숫자를입력 숫자들: Int...)
{
    var sum : Int = 0
    for i in 숫자들{
        sum += i
    }
    print(sum)
}

variadicAdd(합할숫자를입력: 1,2,3)
variadicAdd(합할숫자를입력: 2,2,2,2,2)
variadicAdd(합할숫자를입력: 1,1,1,1,1,1,1,1,1,1)
variadicAdd(합할숫자를입력: 1,1,1,1)

//Test 14 : inout 매개변수
//Swift는 기본적으로 call by value
//함수가 가져오는 매개변수에 변화가 생긴 후에도, 능동적으로 변화가 생긴다.
var myValue = 10
func doubleValue (value: inout Int) -> Int{
    value += value
    return value
}
print(myValue)
print(doubleValue(value: &myValue))
print(myValue)

//Test 15 : 매개변수로 함수를 가져올 때
// 매개변수로 함수를 가져올 수도 있고, 반환(return)하는 데이터가 함수형일 수 도있다.
func FuncA(인치 inches: Float) -> Float{
    return inches * 0.0833333
}
func FuncB(인치 inches: Float) -> Float{
    return inches * 0.0277778
}
let A = FuncA
let B = FuncB

func outputConverterFunc(사용할함수 : (Float)->Float, 가져올변수값 : Float){
    let X = 사용할함수(가져올변수값)
    print("result = \(X)")
}

outputConverterFunc(사용할함수: A, 가져올변수값: 10.0)
outputConverterFunc(사용할함수: B, 가져올변수값: 10.0)

func decideFunction(feet: Bool) -> (Float) -> Float{ //인자는 아니지만, 리턴형이 Float를 받아와서 Float를 반환하는 함수라는 의미
    if feet{
        return A
    }else{
        return B
    }
}
var value1 : Float = 50
var value2 : Bool = true
if value1 > 30{
    value2 == true
}else{
    value2 == false
}
outputConverterFunc(사용할함수: decideFunction(feet: value2), 가져올변수값: value1)

//Test 16 : 클로저 표현식
//다른 이름으로 [block, Lambda function]
//따로 명시하지는 않는 익명함수
let funcC = {(x:Int, y:Int) -> Int in return(x + y)}
print(funcC(15,20))


