import UIKit
print("서브스크립트(Subscript)")
// 배열에 요소에 접근할때 쓰는 문법

struct Test37_Num{
    let num = [1,2,3]
    subscript(i:Int)->Int{
        return num[i]
    }
}
print("디셔너리(Dictionaty)")
// 콜렉션의 종류로, Key-value형태로 이루어진 콜렉션이다. Key는 해시 가능한 타입이다.
// Generic구조체 Dictionary
// 값을 참조하는 구조이며, 순서는 따로 없다. 접근하는데 필요한 것은 Key이다.

//빈 디셔너리 만들기
var test38_x = [Int:String]()                   //비어있는 디셔너리를 만드는 방법 1
var test38_y : Dictionary<String,String> = [:]  //비어있는 디셔너리를 만드는 방법 2
print(test38_x)
print(test38_y)

//값을 갖는 디셔너리 만들기1
var test38_a1 : [Int:String] = [1:"일", 2:"이",3:"삼"]             //Key-value형식을 정의해준 축약형
var test38_a2 : Dictionary<Int,String> = [1:"일", 2:"이",3:"삼"]   //Disionary키워드를 사용
var test38_a3 = [1:"일",2:"이",3:"삼"]                             //축약형

print(test38_a1)
print(test38_a2)
print(test38_a3)

//값을 갖는 디셔너리 만들기2
var test38_b1 : [String:Double] = ["김보통":60.5,"이갈비":42.7,"엄청군":123.4]
var test38_b2 : Dictionary<String,Double> = ["김보통":60.5,"이갈비":42.7,"엄청군":123.4]
var test38_b3 = ["김보통":60.5,"이갈비":42.7,"엄청군":123.4]
print(test38_b1)
print(test38_b2)
print(test38_b3)// 왜 이건 출력순서가 이렇게 표현될까?

let test38_colors = ["빨강":"red","초록":"green","파랑":"blue"]
print(test38_colors)

//과제_ 다른 두가지 방식으로 표현
let test38_colors1 : Dictionary<String,String> = ["빨강":"red","초록":"green","파랑":"blue"]
let test38_colors2 : [String:String] = ["빨강":"red","초록":"green","파랑":"blue"]
print(test38_colors1)
print(test38_colors2)

//디셔너리(Dictionary) 항복 접근/변경
    // 1. key가 Int형인 Dictionary
    // 디셔너리명[Key]의 Key가 정수(Int)형일 경우, 사람들은 Array로 착각할 수 있다. ex) number[1]
    // 하지만 디셔너리명[Key]는 Array가 아니고, 위의 예시를 가져와 보자면, Key가 1인 number라는 디셔너리의 value값을 호출한다.
    //
    // 2. value는 항상 옵셔널(optional)
    // 디셔너리(Dictionary)의 value값은 항상 옵셔널 형태이다.
    // 그러므로 실제로 value값을 출력하기 위해서는 옵셔널 바인딩이나 체이닝 과정을 거쳐야 순수한 값을 구할 수 있다.


print("디셔너리(Dictionary) 항목 변경")
// 항목 변경
var test38_number : [Int:String] = [1:"일",2:"이",3:"삼"]
test38_number[0] = "영"
print(test38_number)
test38_number[4] = "사"
print(test38_number)
test38_number.updateValue("둘", forKey: 2) //수정(변경)
print(test38_number)


print("디셔너리(Dictionary) 항목 삭제")
//디셔너리(Dictionary) 항목 삭제
print(test38_number)
test38_number[2] = nil
print(test38_number)

test38_number.removeValue(forKey: 1) //1이라는 Key를 갖는 value를 삭제
print(test38_number)

print("for~in으로 Dictionary항목 접근")
let test38_2_Colors = ["빨강":"red","초록":"green","파랑":"blue"]
print(test38_2_Colors)
for a in test38_2_Colors{
    print(a)
}
for (cKor,cEng) in test38_2_Colors {
    print(cKor,cEng) //cKor에는 Key값이, cEng는 value로 사용된다,
}

print("그 외에")
print("1. Dictionary 정렬")
// key, value 둘다 정렬이 가능하다.
print("2. Keys나 VAlue형을 Array형으로 만들기")

print("내용정리")
//Swift문법으로 String이나 ARC은 차후에 진행할 예정이다.
// 1. 애플(Swift)에서는 효율과 안전을 위해 var대신 let사용을 적극권장
// 2. 옵셔널 바인딩은 항상 if let 변수명 = 옵셔널변수명{}형태로 사용되는 것이 아니라, var형태로도 사용할 수 있다.(하지만 메서드다보니 대부분 let으로 사용하는것으로 보여짐.)
    // 옵셔널 바인딩의 구조 if (let/var) "변수명" = "옵셔널명"{} -> 만약 "옵셔널명"이 Nil이 아니면 "변수명"에 대입, Nil이면 "변수명"에 대입하지않음.

// 2.1 Optional binding 기본 사용방법
var test39_x : Int?
test39_x = 10
if var test39_xx = test39_x {
    print(test39_xx)
}else{
    print("짜잔~ 이건 Nil값이야~")
}

var test39_y : Int?
if let test39_yy = test39_y {
    print(test39_yy)
}else{
    print("짜잔~ 이건 Nil값이야~")
}

// 2.2 Optional binding 활용법
    // 여러 옵셔널을 한번에 언래핑하기
var test39_pet1: String?
var test39_pet2: String?
test39_pet1 = "cat"
test39_pet2 = "dog"
if let Firstpet = test39_pet1, var Secondpet = test39_pet2{ // 중요한 점은, 추가되는 옵셔널 조건마다 let/var을 추가해줄 것
    print(Firstpet,Secondpet)
}// 이와같은 내용은 아래와 같은 예시에서 사용될 수 있다,

var 주소 : String?
var 이름 : String?
var 연락처 : String?
var 제품명 : String?
주소 = "경기도 권선구 금곡로 46, 513동 1103호"
이름 = "모상현"
연락처 = "010-6435-4096"
제품명 = "모닛베이비"

if let 확인된주소 = 주소, let 확인된이름 = 이름, let 확인된연락처 = 연락처, let 확인된제품명 = 제품명{
    print("주소 : \(확인된주소) \n받는사람 :\(확인된이름) \n연락처 : \(확인된연락처) \n제품명: \(확인된제품명)")
}
else{
    print("기입한 내용에 오류가 있습니다. 주소, 이름, 연락처, 제품명을 확인해주세요.")
}

// 2.3 두가지 옵셔널 타입
// 옵셔널이 항상 유효한 값을 가질 경우, 옵셔널이 암묵적인 언래핑이 되도록 선언할 수도있음. -> Nil값을 갖을 경우가 없다면

// ! ? 차이는 뭘까?
let test39_1_x : Int? = 1
let test39_1_y : Int = test39_1_x!
let test39_1_z = test39_1_x
print(test39_1_x,test39_1_y,test39_1_z)
print(type(of: test39_1_x),type(of: test39_1_y),type(of: test39_1_z))

let test39_1_a : Int! = 1
let test39_1_b : Int = test39_1_a   //optional로 사용되지 않으면 자동으로 unwrap
let test39_1_c : Int = test39_1_a!
let test39_1_d = test39_1_a
let test39_1_e = test39_1_a + 1
print(test39_1_a,test39_1_b,test39_1_c,test39_1_d,test39_1_e)
print(type(of: test39_1_a),type(of: test39_1_b),type(of: test39_1_c),type(of: test39_1_d),type(of: test39_1_e))

//실제 사용 예시
class test39_1_MyAge{
    var test39_1_age : Int!
    init(test39_1_age: Int){
        self.test39_1_age = test39_1_age
    }
    func printAge(){
        print(test39_1_age)                         // 옵셔널(1)
        print(test39_1_age + 1)                     // 그냥 2
        let test39_1_age1 : Int = test39_1_age      // 옵셔널아님
        print(test39_1_age1)                        // 1
        let test39_1_age2 = test39_1_age + 2        // 옵셔널아님
        print(test39_1_age2)                        // 3
    }
    
}
var test39_1_han = test39_1_MyAge(test39_1_age: 1)
test39_1_han.printAge()

// 2.4 Nil-Coalescing Operator (Nil합병연산자) ??
// 옵셔널 변수 ?? nil일 때, 할당되는 값을 선언해줄 수 있다.

let defaultColor = "black"
var userDefinedColor: String? // defaults to nil

var myColor = userDefinedColor ?? defaultColor // nil이므로 defaultColor인 black으로 할당된다.
print(myColor)
print(type(of: myColor))
userDefinedColor = "red"
myColor = userDefinedColor ?? defaultColor //nil이 아니므로 defaultColor는 설정되지 않는다. 그리고, 해당 작업을 통해서 옵셔널탈출이 발생한다. 즉, myColor의 데이터타입은 Optional("red")가 아니라 red가 된다.
print(myColor)
print(type(of: myColor))

// 2.5 형변환 (as! as?로 downcasting)
// 다운케스팅은 부모 인스턴스를 자식 클래스로 변환하는 데 사용한다.
    // 성공 확신이 있으면 as! 키워드를 사용하며 강제 변환
        // 변환이 안되면 crash
    // 성공 확신이 없으면 as?를 사용하여 안전하게 변환
        // 변환이 안되면 nil을 리턴하므로 옵셔널 타입으로 반환함

//let myScrollView: UIScrollView = UIScrollView() // 부모 인스턴스
//let myTextView = myScrollView as! UITextView // 부모인스턴스 as! 자식클래스
//
//if let myTextView = myScrollView as? UITextView {
//    print("Type cast to UITextView succeeded")
//}else{
//    print("Type cast to UITextView failed")
//
//}

//Ex 형변환 예제
var test39_2_x : Any = "Hi"
print(test39_2_x, type(of: test39_2_x))
test39_2_x = 10

var test39_2_y : Int = test39_2_x as! Int
var test39_2_z : Int? = test39_2_x as? Int
print(test39_2_x, type(of: test39_2_x))
print(test39_2_y, type(of: test39_2_y))
print(test39_2_z, type(of: test39_2_z)) // 안정된 코드를 위해 한겹 둘러싸준다.

// 3. 범위 연산자
    // 1) 닫힌 범위 연산자
        // x...y
            // x에서 시작하여 y로 끝나는 범위에 포함된 숫자
        // 5...8
            // 5,6,7,8
    // 2) 반 열린 범위 연산자
        // x..<y
            // x부터 시작하여 y가 포함되지 않는 모든 숫자
        // 5..<8
            // 5,6,7
    // 3) One-Sided Ranges
let names = ["A","B","C","D"]
for name in names[2...]{ //case 1
    print("case1 : \(name)")
}
for name in names[...2]{ //case 2
    print("case2 : \(name)")
}
for name in names[0..<3]{ //case 3
    print("case3 : \(name)")
}

