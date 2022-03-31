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
open class var blue : UIColor {get}
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
