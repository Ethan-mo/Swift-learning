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
var a : Double = 25
print(a)
print(a.squared)
print(3.141592.squared)
