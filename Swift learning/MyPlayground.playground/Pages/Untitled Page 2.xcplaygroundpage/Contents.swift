
//Test 17 : 다양한 예제를 클로저로 축약해서 표현해보기

//17_1 축약이 되지않은 문장
let multiply = {(val1: Int, val2: Int)-> Int in
    return val1 * val2
}
var result = multiply(10, 20)
print(result)

let add = {(val1:Int,val2:Int)->Int in
    return val1+val2
}
result = add(10, 20)
print(result)

func math(x:Int,y:Int,cal:(Int,Int)->Int) -> Int{
    return cal(x,y)
}
result = math(x:10, y:20, cal:add)
print(result)

result = math(x:10, y:20, cal:multiply)
print(result)


//17_2 mul과add를 익명함수(클로저)로 축약
result = math(x: 10, y: 20, cal: {(val1 : Int,val2 : Int)->Int in return val1 + val2})
print(result)

result = math(x: 10, y: 20, cal: {(val1 : Int, val2 : Int) -> Int in return val1 * val2})
print(result)

//17_3 후방클로저로 축약
result = math(x: 10, y: 20){(val1 : Int,val2 : Int) -> Int in return val1 + val2}
print(result)

result = math(x: 10, y: 20){(val1 : Int,val2 :Int)-> Int in return val1 * val2}
print(result)


//17_4_1 함수의 리턴을 생략하는 방식으로 축약
result = math(x: 10, y: 20, cal: {(val1 : Int, val2 : Int) in return val1+val2})
print(result)
print(type(of: result))
//17_4_2 위의 예시를 후방 클로저 방식으로 축약
result = math(x: 10, y: 20){(val1 : Int, val2 : Int) in return val1 + val2}
print(result)
print(type(of: result))

//17_5_1 매개변수로 가져오는 함수의 매개변수를 축약
result = math(x: 10, y: 20, cal: {return $0 + $1})
print(result)
//17_5_2 위 예시를 후방 클로저 방식으로 축약
result = math(x: 10, y: 20){return $0 + $1}
print(result)

//17_6_1 수식이 1줄일 경우 return생략 가능
result = math(x: 10, y: 20, cal: {$0+$1})
print(result)
//17_6_2 위 예시를 후방 클로저 방식으로 축약
result = math(x: 10, y: 20){$0+$1}
print(result)

//Test18 : 클래스
//프로퍼티(property)
//프로퍼티는 저장프로퍼티, 계산프로퍼티로 나누어진다.

class Man{
    var age : Int
    var weight : Double
    let run = {(age: Int,weight: Double) -> Bool in
        if age>15{
            return true
        }else{
            return false
        }
    }
}
//여기서 age, weight는 저장프로퍼티
//run은 계산프로퍼티이다.
