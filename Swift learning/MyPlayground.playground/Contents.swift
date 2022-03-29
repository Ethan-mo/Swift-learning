func printName(firstName:String, lastName:String?){
    //if let
    if let lName = lastName { // 옵셔널 변수가 값이 있다면 언래핑
        print(lName,firstName)
    }
    else{
        print("성이 없네요")
    }

    //guard let
    guard let lName = lastName else{ //옵셔널 변수가 값이 없다면
        print("성이 없네요!")
        return
    }
}
printName(firstName: "길동", lastName: "홍")
