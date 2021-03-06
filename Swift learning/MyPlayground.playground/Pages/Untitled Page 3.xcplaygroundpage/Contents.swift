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

print("Test 29 : 클래스와 구조체의 공통점")
//1. 프로퍼티를 정의할 수 있음
//2. 메서드를 사용할 수 있음
//3. []를 사용해 첨자 문법으로 내부의 값을 액세스 할 수 있음
//4. 초기상태 설정을 위한 초기화 함수(initializer)를 정의할 수 있음
//5. extension 가능
//6. protocol 채택가능
print("Test 29_1 : 클래스와 구조체의 차이점")
//1. 상속이 가능하다
//2. 타입 캐스팅(is, as, as? as!)을 통해 실행 시점에 클래스 인스턴스의 타입을 검사하고 해석 가능
//3. deinitializer(deinit{})로 사용한 자원을 반환 가능 (* 클래스는 래퍼런스 타입이기 때문)
//4. 참조 카운팅을 통해 한 클래스 인스턴스를 여러 곳에서 참조(사용)가능
//- 래퍼런스 타입이기 때문에, 인스턴트또한 래퍼런스의 특성으로 다른 곳에서 참조되어 사용할 수 있다.
print("구조체")
struct s_Human{
    var age : Int = 1
}
var kim = s_Human()
var lee = kim

print (kim.age, lee.age)
lee.age = 20
print(kim.age, lee.age)
kim.age = 30
print(kim.age, lee.age)
print("클래스")
class c_Human {
    var age : Int = 1
}
var kim1 = c_Human()
var lee1 = kim1
print(kim1.age, lee1.age)
lee1.age = 20
print(kim1.age, lee1.age)
kim1.age = 30
print(kim1.age, lee1.age)

print("실습")
struct Resolution1{
    var width = 0
    var height = 0
} // 이 구조체는 길이와 높이의 기본 값을 설정해주는 구조체이다.

class VideoMode {
    var resolution = Resolution1()
    var frameRate = 0
    var name : String?
} // 이 클래스는 길이와 높이는 구조체형으로 가져오기 때문에, '길이'와 '높이'에 한하여서는 값만 가져온다.(즉, 불러올 주소 자체가 없다는 뜻.)

var hd = Resolution1(width: 1920, height: 1080)  // 변수를 하나 만들었는데, 이는 구조체 형식을 가지고 있다.
var highDef = hd                                // 그리고 그 변수는 또 다른 변수의 이름을 가지고 있다.
print(hd.width, highDef.width)                  // 구조체타입을 가진 변수를 또 다른 변수에 대입하였다. 이는 하나의 레퍼런스가 아닌, 복제1, 복제1_1이라고 생각하면 된다. 복제2가아닌 복제 1_1인 이유는, highDef가 Resolution1를 직접 복제한게 아닌, hd를 복제했기 때문이다.
hd.width = 1024                                 // 복제1의 width의 값을 변경하였다.
print(hd.width, highDef.width)

var xMonitor = VideoMode()          //이제 클래스를 만들어 보겠다.
xMonitor.resolution = hd            //해당 클래스에서 width와 height값은 구조체형식으로 가져온다. 여기서 궁금한 것은, 구조체타입을 따르는 클래스는 해당 변수를
xMonitor.name = "LG"
xMonitor.frameRate = 30
print(xMonitor.frameRate)

var yMonitor = xMonitor

yMonitor.frameRate = 25
print(yMonitor.frameRate)
print(xMonitor.frameRate)

hd.width = 1004
print(xMonitor.resolution.width)    //해당 결과를 통해 알 수 있는 것은, hd라는 구조체를 복제1이라고 지칭해보자. 클래스명.resolution = hd이라고 함으로써, 클래스명.width나 클래스명.height값은 hd라는 구조체의 주소(레퍼런스)를 통해 값을 불러온다.
                                    //즉, 위의 예시에서는 xMonitor의 width나 height값은 복제1인 hd.width나 hd.height값의 레퍼런스를 가져오는 것이므로, hd의 width값이나 height값이 변경되면, 당연히 xMonitor의 width와 height값도 변경된다.

//언제 클래스를 쓰고 언제 구조체를 쓰는가?
//1. 구조체는 간단한 데이터 값들을 한데 묶어서 사용하는 경우
//2. 전체 덩어리 크기가 작은 경우, 복사를 통해 전달해도 좋은 경우 구조체
//3. 멀티 쓰레드 환경이라면 구조체가 더 안전 (당연히, 레퍼런스타입의 데이터가 멀티 쓰레드에 의해 사용된다면, 문제가 발생할 수 있음.)



