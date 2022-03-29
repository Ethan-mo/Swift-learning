func multiplyByTen(value: Int?){
    guard let number = value, number < 10 else { // 조건식이 거짓일 때 실행
        print("수가 10보다 크다")
        return
    }
    print(number*10) //조건식이 참일 때 실행, 주의 : number를 여기서도 사용 가능
}
multiplyByTen(value: 3) //30

//guard문 만들기
func Testfuc(a:Int?){
    guard let b = a, b > 10 else{
        print("10보다 크지 않습니다")
        return
    }
    print(a)
}
Testfuc(a: 8)
