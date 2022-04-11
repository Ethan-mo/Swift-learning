print("Test 40 : swift문법 정리")
// 메서드(method)
    // 특정 클래스, 구조체, 열거형 내의 함수
    // 함수를 스위프트 클래스 내에 선언하면 메서드라 부름
        //메서드(method)의 형식 (class,struct,enum)

// 메서드 #1 외부, 내부 매개변수 명
    // 외부 매개변수 명 (argument label)
    // 내부 매개변수 명 (parameter name)
func add(first x: Int, second y : Int) -> Int {
    return (x + y)
}
add(first: 20, second: 30)
// 여기서 first는 argument
// second는 parameter


