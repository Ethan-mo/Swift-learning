print("Test 31 : 옵셔널 체이닝(optional Chaining)")
var x : String? = "Hi"      //x라는 변수는 nil값이 올 수도있다. 다만, 지금은 "Hi"라는 값을 가지고 있다.

// 첫 번째 방법. forced unwrapping : unsafe
// X! 이 방법은 안전하지 않는다.

// 두 번째 방법. optional binding : safe
// if let a = x{
//     print(a)
// } //이 방법은 안전하다.

// 세 번째 방법. nil coalescing operator : safe
// let c = x ?? ""

// 네 번째 방법. optional chaining : safe
// let b = x?.count


var 실습 : String? = "Hi"
print(실습, 실습!)                // 예상, 실습 == optional("Hi")
print("1번쨰")
if let a = 실습{
    print(a)                    // 예상, a == Hi
}

print("2번쨰")
let b = 실습!.count              // 실습! == "Hi"이니, 실습!.count == 2
print(type(of:b),b)             // 예상, type(of:b) == Int, b == 2

print("3번째")
let b1 = 실습?.count             // 실습? == optional("Hi")이니, 실습?.count == optional(2)
print(type(of:b1), b1, b1!)     // b1! == 2인것으로 보아, !와?의 차이를 생각해 볼 수있다.

let c = x ?? ""
print(c)

print("실습")
class Person {
    var name : String?
    var age : Int?
    var sns : SNS? = SNS()
}
class SNS {
    var fb : FaceBook? = FaceBook()
    var tt : Twitter?
}
class FaceBook {
    var account : String = "aaa@bbb.com"
}
class Twitter {
    var account : String = ""
}

let p = Person()

if let s = p.sns{ // p라는 이름으로 상수형의 데이터는 Person()이라는 클래스 구조를 가지고 있다. Person()클래스의 옵셔날을 풀어주기 위해 조건문을 제시한다.
    if let f = s.fb{
        print("1: \(f.account)")
    }
}

if let account = p.sns?.fb?.account{ //옵셔널 체이닝을 하더라도 결과물은 optional형태의 데이터이다. 해당 데이터를 마지막으로 옵셔널 바인딩을 통해 처리를 해주어야한다.
    print("2: \(p.sns?.fb?.account)")
}

print("3: \((p.sns?.fb?.account)!)") //비추 방식
print("4: \(p.sns!.fb!.account)")

print("5: \(p.sns?.tt?.account)")
// print("6: \(p.sns!.tt!.account)")

print("Test 32 : 오류 처리(Error Handling)")
// 예외처리를 의미하며, 런타임 시 오류를 발견하여 응답하여 복구하는 과정
// 오류 발생 시 무제를 보정하거나 사용자에게 오류를 알림
// 4가지 방법이 있다. 그 중 2가지만 배워보자.
// 1. throwing function
// throws 키워드를 사용하며, error를 던질 수 있다. ex) func can() throws, func 함수명() throws -> String
// throws라는 키워드가 있다는 것은, error handling을 해야한다는 의미이다.
//
// 2. 오류 발생 가능 함수의 호출 방식(do~try~catch)
// do~ try~와 catch~키워드를 사용하며,
//사용 예시
//do{
//    audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
//} catch let error as NSError{
//    print("Error-initPlay : \(error)")
//}
print("Test 33 : Generic문법 사용하기")
// 구조체(structure)의 종류로, 자료형이 나중에 결정하게끔 하는 기능을 수행한다.
var aaa : [Int] = [1,2,3,4]
var bbb : Array<Int> = [1,2,3,4]

func myPrint<T>(aaa: T, bbb: T){
    print(bbb,aaa)
}
myPrint(aaa:1,   bbb: 2)
myPrint(aaa:2.5, bbb: 3.5)
myPrint(aaa:"Hi",bbb:"Hello")

func swapAny<any>(_ a:inout any, _ b:inout any){
    let temp = a
    a = b
    b = temp
}
var 첫번째 = 50
var 두번째 = 30
print(첫번째, 두번째)
swapAny(&첫번째, &두번째)
print(첫번째, 두번째)
