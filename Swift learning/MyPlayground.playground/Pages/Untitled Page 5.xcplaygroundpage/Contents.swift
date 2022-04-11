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
