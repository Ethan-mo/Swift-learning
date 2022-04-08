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
