print("Test 40 : swift문법 정리")
// 메서드(method)
    // 특정 클래스, 구조체, 열거형 내의 함수
    // 함수를 스위프트 클래스 내에 선언하면 메서드라 부름
        //메서드(method)의 형식 (class,struct,enum)

// 메서드 #1 외부, 내부 매개변수 명
    // 외부 매개변수 명 (argument label)
    // 내부 매개변수 명 (parameter name)
func add(first x: Int, second y : Int) -> Int {
    return (x + y)
}
add(first: 20, second: 30)
// 여기서 first는 argument
// second는 parameter


// seld
    // 현재 클래스 내 메서드나 프로퍼티를 가르킬 때 메서드나 프로퍼티 앞에 self를 붙임
    // 아래 첫번째 소스에서는 self를 붙이거나 생략해도 된다.
    // 두번째 소스에서는 매개변수와 구분하기 위해 반드시 써야함.

// 1. self를 붙이거나 생략해도 되는 경우
class Man{
    var age : Int = 1
    var weight : Double = 3.5
    init(yourAge: Int, yourWeight : Double){
        age = yourAge
        weight = yourWeight
    }
}
// 2. self를 반드시 붙여줘야 하는 경우
class Man2{
    var age : Int = 1
    var weight : Double = 3.5
    func display(){
        print("나이 = \(age), 몸무게 = \(weight)")
    }
    init(age : Int, weight : Double){ // 여기가 다르다, 파라미터가 이름이 다르지 않고 같기 때문에, 해당 클래스 내의 프로퍼티의 변수명과 파라미터명이 동일하게되는 문제가 발생한다.
        self.age = age
        self.weight = weight
    }
}
var kim : Man2 = Man2(age: 10, weight: 20.5)
kim.display()
