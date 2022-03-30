
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
    
    init(){
        age = 16
        weight = 57.5
    }
}
//여기서 age, weight는 저장프로퍼티
//run은 계산프로퍼티이다.

//Test18_2 : 인스턴스 메서드
class Human{
    var age : Int = 27
    var weight : Double = 57.5
    func display(){ //이처럼 func 메서드명(){}으로 만드는건 계산프로퍼티, 인스턴스 메서드이다.
        print("나이 = \(age), 몸무게 = \(weight)")
    }
}
//인스턴트 만들자!
let Mosang : Human = Human()
Mosang.display()
print(Mosang.age)

//Test18_2_2 : 타입메서드(클래스 메서드)
class Human2{
    var age : Int = 27
    var weight : Double = 57.5
    func display(){ //이처럼 func 메서드명(){}으로 만드는건 계산프로퍼티, 인스턴스 메서드이다.
        print("나이 = \(age), 몸무게 = \(weight)")
    }
    class func cM(){
        print("cM은 클래스 메서드입니다.")
    }
    static func scM(){
        print("scM은 클래스 메서드(static)입니다.")
    }
}
//인스턴스 만들자!2
let Ethan = Human()
Ethan.display()
Human2.cM() //cM()이나 scM()은 타입메서드(클래스메서드)이기 때문에, 본 클래스명을 붙여준다.
Human2.scM()

//Test19 : 생성자
//초기화 틀을 만들어주는 것으로, 클래스 내에 init()을 만들어주면, 인스턴스를 만들었을 때, var 인스턴스1 : 클래스 = 클래스()형태는 사용할 수 없다.
class Human3{
    var age : Int
    var weight : Double
    func display(){
        print("나의 나이는: \(age)이고, 나의 몸무게는: \(weight)입니다.")
    }
    
    init(나이: Int, 몸무게: Double){
        age = 나이
        weight = 몸무게
    }
}
//인스턴스 만들자!3
var 상현 : Human3 = Human3(나이:62,몸무게:72.4)
상현.display()

//Test20 : 계산프로퍼티
class Human4{
    var age : Int = 1
    var weight : Double = 5.0
    //계산 프로퍼티 추가
    var 만나이 : Int{
        get{
            return age - 1
        }
    }
    //위와같이 setter가 없으면 get{}eㅗ 생략할 수 있따.
    
    func display(){
        print("나의 나이는 : \(age), 나의 무게는 : \(weight)")
    }
    
    init(나이 age:Int, 몸무게 weight:Double){
        self.age = age
        self.weight = weight
    }
}

let 모상현 : Human4 = Human4(나이:19,몸무게:52.4)
모상현.display()
print(모상현.만나이)

//Test21 : failable initialize가 있는 클래스의 인스턴스 생성
class Human5{
    var age : Int
    var weight : Double
    func display(){
        print("나의 나이는\(age),나의 몸무게는\(weight)이다.")
    }
    init?(나이 age:Int, 몸무게 weight: Double){
        if age <= 0{
            return nil
        }else{
            self.age = age
        }
        self.weight = weight
    }
}

var Kim : Human5? = Human5(나이: 1, 몸무게: 3.5) //옵셔널 형으로 선언
//옵셔널 타입의 데이터를 언래핑하는 방법 4가지

if let Kim1 = Kim{ // 옵셔널 바인딩
    Kim1.display()
}
if let Kim2 = Human5(나이: -2, 몸무게: 5.5){
    Kim2.display()
    
}else{
    print("값 중에 Nil값이 들어갔다.")
}
var Kim3 : Human5 = Human5(나이: 3, 몸무게: 7.5)!
Kim3.display()

var Kim4 : Human5? = Human5(나이: 4, 몸무게: 10.5)
Kim4!.display()

//+ 추가 과제
class Human6{
    var age : Int
    var weight : Double
    func display(){
        print("나이는 : \(age),몸무게는 \(weight)입니다")
    }
    init!(나이 age:Int,몸무게 weight:Double){
        if age <= 0 || weight <= 0{
            self.age = 0
            self.weight = 0
        }else{
            self.age = age
            self.weight = weight
        }
    
    }
}

var Mo : Human6? = Human6(나이: -1, 몸무게: 17.0)
Mo?.display()
var Mo1 :Human6? = Human6(나이: -1, 몸무게: 17.0)
if let Mo2 = Mo1{
    Mo2.display()
}
if let Mo3 = Human6(나이: -17, 몸무게: 12.0){
    Mo3.display()
}
