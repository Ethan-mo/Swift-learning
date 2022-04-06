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


struct Stack <T> {
    var items = [T]()
    mutating func push(_ item: T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stackOfInt = Stack<Int>()
print(stackOfInt.items)
stackOfInt.push(1)
print(stackOfInt.items)
stackOfInt.push(2)
print(stackOfInt.items)
stackOfInt.push(3)
print(stackOfInt.items)
stackOfInt.push(4)
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)

var stackOfString = Stack<String>()
print(stackOfString.items)
stackOfString.push("일")
print(stackOfString.items)
stackOfString.push("이")
print(stackOfString.items)
stackOfString.push("삼")
print(stackOfString.items)
stackOfString.push("사")
print(stackOfString.items)
stackOfString.pop()
print(stackOfString.items)
stackOfString.pop()
print(stackOfString.items)
stackOfString.pop()
print(stackOfString.items)
stackOfString.pop()
print(stackOfString.items)

// 대표적으로 Array는 대표적인 generic구조체의 종류이다.
print("Test34 : Collection Type - 1. 배열 (Array(연결리스트))")
//빈 배열을 표현하는 다양한 방법
var test34_x : [Int] = []
var test34_y = [Int]()  // *아주 중요 :가 아닌 =를 썼다는 점.
var test34_z : Array<Int> = []
var test34_i : Array<Int> = Array()

var test34_a : [Int] = [1,2,3,4]
var test34_b : Array<Int> = [1,2,3,4]
var test34_c : Array<Double> = [1.2,2.3,4.6,5.1]
// @frozen struct Array<Element>
// @frozen의 의미는 저장프로퍼티를 추가하거나 삭제가 불가.

let test34_number = [1,2,3,4]
let test34_odd : [Int] = [1,3,5]
let test34_even : Array<Int> = [2,4,6]

//배열을 서로 다른방법으로 정의한 모습이다.
print(type(of: test34_number))
print(test34_number)

print(type(of: test34_odd))
print(test34_odd)

print(type(of: test34_even))
print(test34_even)

let test34_animal = ["dog","cat","cow"]
print(type(of: test34_animal))
print(test34_animal)

//배열 유의사항
    //1. 빈 배열은 var로 선언할 것. let은 수정이 불가.
    //2. var number = [Int](), number[0] = 1
        // 이러한 코드는 불가능, 왜? -> number[0]이라는 공간이 생성되어있지 않기 때문에, '1'이라는 값을 불러올 수 없음.
        // 해결하기 위해서는 어떤 값이든 append해준 후에, 해당 공간을 생성해주어야 한다.

var test34_1_x = [0,0,0,0,0]
print(test34_1_x)
var test34_1_x1 = Array(repeating: 0, count : 5)
print(test34_1_x1)
var test34_1_x2 = [Int](repeating: 1, count: 3)
print(test34_1_x2)
var test34_1_x3 = [String](repeating: "A", count: 42)
print(test34_1_x3)

print("for~in으로 배열 항목 접근방법")
let test34_2_colors = ["red","green","blue"]
print(test34_2_colors)

for test34_2_color in test34_2_colors {
    print(test34_2_color)
}
print("각 배열의 index순서값 불러오기")
for (index, test34_2_color) in test34_2_colors.enumerated() {
    print("\(index)번째 값은 : \(test34_2_color)")
}
print("항목이 몇 개인지(count), 비어있는지(isEmpty)알아내기")
let test34_3_num = [1,2,3,4]
var test34_3_x = [Int]()
print(test34_3_num.isEmpty) //비어있으면 true, 안비어있으면 false
print(test34_3_x.isEmpty)

if test34_3_num.isEmpty{
    print("비어있습니다.")
}else{
    print(test34_3_num.count)
}

print("first와 last프로퍼티")
let test34_4_num = [1,2,3,4]
let test34_4_num1 = [Int]()

print(test34_4_num.first, test34_4_num.last)
print(test34_4_num1.first, test34_4_num1.last)

if let f = test34_4_num.first, let l = test34_4_num.last {
    print(f,l)
}

print("첨자(subscript)로 항목 접근")
var test34_5_num = [1,2,3,4]
print(test34_5_num[0],test34_5_num[3])
print(test34_5_num.first!)
for i in 0...test34_5_num.count-1{
    print(test34_5_num[i])
}
for i in 0...test34_5_num.endIndex-1{ // endIndex는 배열의 마지막 순서+1
    print(test34_5_num[i])
}
// count와 endIndex의 차이점은?
print(test34_5_num[1...2])
test34_5_num[0...2] = [10,20,30]
print(test34_5_num)

print("Array는 구조체이므로 값 타입")
var test34_6_num = [1,2,3]
var test34_6_x = test34_6_num
test34_6_num[0] = 100
print(test34_6_num)
print(test34_6_x)

print("Array 요소의 최댓값 최솟값 : max(), min()")
var test34_7_num = [1,2,3,10,20]

print(test34_7_num)
print(test34_7_num.min())
print(test34_7_num.max())
print(test34_7_num.min()!)
print(test34_7_num.max()!)

print("Array 요소의 정렬")
var test34_8_num = [1,5,3,2,4]
print(test34_8_num)
test34_8_num.sort() // sort는 원본을 정렬해서 변경
print(test34_8_num)

test34_8_num[0...4] = [2,3,4,5,1]
print(test34_8_num)
print(test34_8_num.sorted())// sorted는 원본이아닌 사본으로 정렬
print(test34_8_num)
print(test34_8_num.sorted(by:>))//내림차순
