import UIKit
import Darwin
print("Test 23 : extension 새로운 기능 추가하기")
//클래스, 구조체, 열거형, 프로토콜에 새로운 기능을 추가할 때 사용한다.
//extension은 하위 클래스를 생성하거나 참조하지 않고 기존 클래스에
//'메서드', '생성자(initializer)','계산 프로퍼티'등을 추가하기 위해 사용된다.
//스위프트 언어의 Built-in클래스와 Ios 프레임워크에 내장된 클래스에 기능을 추가할 때 사용하기 좋다.
//형태는
//extension 기존타입이름 {
//
//}
extension Double {
    var squared : Double{
        return self*self
    }
}
var a : Double = 0.2
print(a)
print(a.squared)
print(3.141592.squared)
print(a.isZero)
print("Test 23_2 : extension의 쓰임새")
//extension은 다중으로 채택되는 프로토콜들을 조금 더 체계적으로 관리할 수 있게 해준다.
//대표적인 예시로,
//class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{}
//라는 클래스가 존재할 때,
//class ViewController: UIViewControlle{}
//extension ViewController: UIPickerViewDelegate{}
//extension ViewController: UIPickerViewDataSource{}
//이런 식으로 나누어서 변경점을 추가할 수 있으므로, 한꺼번에 합쳐서 수정하는 경우보다 깔끔하고 이해하기 쉽게 정리할 수 있다.

print("Test 24 : 접근제어 access control")
public class MyClass{
    fileprivate var name : String = "Kim"
    //현재 소스 파일 내에서만 사용 가능
    private func play() {}
    //현재 블럭 내에서만 사용 가능
    func display(){}
}
//open class var blue : UIColor { get }
//open : 모듈 외부까지(클래스에만 사용) 접근 가능
//class : 클래스 프로퍼티

print("Test 25 : 프로토콜(protocol)과 Delegate")
//Delegation이라는 개념은 디자인 패턴(design pattern)의 한 종류이며, 클래스나 구조체가 일부 책임을 다른 유형의 인스턴스로 전달 할 수 있도록 하는 디자인 패턴이다.
//위임된 기능은 프로토콜에서 정의하며, delegate가 위임된 기능을 제공한다.
//보통 한 클래스가 가진 역할을 분류할 때, 각각의 Delegate로 분류되어 해당 기능에 대한 수행을 맡는다.

print("Test 26 : 프로토콜(prorocol)이란?")
//특정 클래스와 관련없는 프로퍼티로, 메서드 선언 집합이다.
//- 함수(메서드)정의는 없음
//- 기능이나 속성에 대한 설계도
//- 클래스(구조체, 열거형)에서 채택(adopt)하여 메서드를 구현해야 함
//자바의 다중상속을 가능하게하는 인터페이스(interface)와 같은 역할이다.
//프로토콜 구조:
//protocol 프로토콜1 {
//    var 프로퍼티1 : String?
//    func 메서드1()
//}
//protocol 프로토콜2 : 다른프로토콜1, 다른프로토콜2 { //프로토콜은 다중 상속이 가능하다.
//
//}
//프로토콜 사용 예시
protocol SomeProtocol {
    var x: Int { get set }  //get set은 읽기와 쓰기가 가능하다는 의미
    var y: Int { get }      //get은 읽기 전용
    static var tx: Int { get set }
    static func typeMethod()// -> void return값으로 void가 생략
    func random() -> Double // 중요한 것은 프로토콜이기 때문에 각 메서드 뒤에 {}를 달아서는 안된다는 점이다. 프로토콜은 메서드를 선언만 해줄 수 있다. 그러므로 {}를 사용해서는 안된다.
}
//실제 프로토콜 사용 예시
protocol Runnable {
    var x : Int {get set}
    func run()
}
class Man : Runnable{               //부모 클래스가 없고 프로토콜만 채택하는 경우에는 해당 프로토콜을 부모 클래스로 오인할 수 있다.
    var x : Int = 1                 //{get set}이기 떄문에 읽기, 쓰기가 가능
    func run(){print("달린다~")}      //프로토콜 단위에서는 선언만, 클래스 내부에서 함수(메서드)를 정의
}
var Sang = Man()
Sang.run()


print("Test 27 : 열거형 (enum)")
// 관련있는 데이터들이 멤버로 구성되어 있는 자료형 객체
//- 원치 않는 값이 잘못 입력되는 것 방지
//- 입력 받을 값이 한정되어 있을 때
//- 특정 값 중 하나만 선택하게 할 때
// 사용 예시
enum 색깔 {
    case RED, BLUE, GREEN, YELLOW, BLACK
}
enum 색상 {
    case 빨강
    case 블루
    case 초록
    case 노랑
    case 검정
}
var Color1 : 색상
print(색상.노랑)
var Color2 = 색상.노랑 // Color2의 타입을 정의해 주지 않아도 바로 초기화해 버렸다.
print(Color2)
print("Color2의 타입은 :  + \(type(of: Color2))")
Color2 = .검정        // Color2의 타입이 이미 열거형으로 선언이 되었있기에, 열거형 명을 생략해준 .멤버 형태로 사용되어진다.
print(Color2)

print("Test 27_1 : Swift의 열거형이 특별한점")
enum Week: String{
    case Mon, Tue, Wed, Thur, Fri, Sat, Sun
    func printWeek(){
        switch self{
        case .Mon, .Tue, .Wed, .Thur, .Fri:
            print("평일")
        case .Sat, .Sun:
            print("주말")
        }
    }
}
var Today : Week = Week.Sun
print("\(Today)요일은")
Week.Sun.printWeek()

print("Test 27_2 : 열거형에 타입 지정하기")
enum Color: Int{
    case red
    case black
    case green = 2
    case blue
}
print(Color.red)
print(Color.blue)
print(Color.black .rawValue)
print(Color.green.rawValue)
print(Color.blue.rawValue)

print("Test 27_3 : 연관 값(associated value)을 갖는 열거형")
enum Date {
    case intDate(Int, Int, Int) //(int, int, int)형 연관값을 갖는 intDate
    case stringDate(String)     //String형 연관값을 갖는 StringData
}
var todayDate = Date.intDate(2021, 4, 30)
//todayDate = Date.stringDate("2021년 5월 20일")
switch todayDate{
case .intDate(let year, let month, let day):
    print("\(year)년 \(month)월 \(day)일")
case .stringDate(let date):
    print(date)
}
print("Test 27_4 : 옵셔널은 사실 열거형이다.")
let age : Int? = 30 //Optional(30)

switch age{
case .none: // nil인 경우
    print("나이 정보가 없습니다.")
case .some(let a) where a < 20:
    print("\(a)살 미성년자 입니다. ")
case .some(let a) where a < 71:
    print("\(a)살 성인입니다.")
default:
    print("경로우대입니다.")
}

// + 추가과제
var a1 : Int? = 20 // .some(20)
var a2 : Int? = Optional.some(10)
var a3 : Int? = Optional.none
var a4 : Optional<Int> = 30
print(a1,a2,a3,a4)

print("Test 28 : 구조체")
//구조체의 종류는 다양하다.
//일반적으로 우리가 자주사용하는 Int, Double, String등은 일반적인 구조체이다.
//조금 다른게 있다면, @frozen이라는 문구를 추가하여 추가, 삭제가 불가능하게 설정된 구조체라는 점이다.
//하지만, Array나 Dictionary, Set은 Generic Structure라고 부르며, 이는 만든 후에 정의가 되는 형태이다.
//+ 참고로 nil도 구조체이다.
//+ 구조체는 상속이 불가능하다.
struct Resolution {
    var width = 1024
    var height = 768
}
let myComputer = Resolution()
print(myComputer.width)
let myComputer2 = Resolution(width: 12313123, height: 12312313)
print(myComputer2.width)

class Resolution2 {
    var width : Int
    var height : Int
    init(너비 width:Int, 높이 height:Int){
        self.width = width
        self.height = height
    }
}
let 사람1 = Resolution2(너비:12313,높이:123123)
print(사람1.width)

