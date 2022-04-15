//
//  ViewController.swift
//  MovieHsh
//
//  Created by Ethan on 2022/04/14.
//

import UIKit

//배열에 있는 항목을 테이블 뷰에 표시
let name = ["aaa","bbb","ccc","ddd","eee"]
//JSON으로 받아온 Data를 소분할 구조체를 만든다. MovieData, BoxOfficeResult, DailyBoxOfficeList...
struct MovieData: Codable{ //Codable이라는 프로토콜은 무엇일까? : encoding과 decoding을 가능하게 해주는 프로토콜
    let boxOfficeResult: BoxOfficeResult //구조체의 프로퍼티의 이름은 가져오는 JSON의 양식과 반드시! 같아야한다.
}
struct BoxOfficeResult: Codable{
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}
struct DailyBoxOfficeList: Codable{
    let movieNm: String
    let audiCnt: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movieData: MovieData?
    @IBOutlet weak var table: UITableView!
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4f9b60b506fdae876be3f25d2a90d2cc&targetDt=20220413" // 반드시 뒤에 s 붙이기
    // IOS9 부터 외부 네트워크와 관련된 보안 규칙이 신설
    // 네트워크 객체를 사용해서 SSL보안프로토콜을 사용하지 않는 네트워크에 접속하려면, info.plist 파일에 설정을 추가해주어야 함
    // 방법, 1) [info.plist] 2) [App Transport Security Settings] 3)하위 폴더에 [Allow Arbitrary Loads] 4) [No]를 [Yes]로 변경
    // 이 방법은 Apple에서 좋아하지 않는 방식으로, 앱을 허가해주지 않을 수도 있다. (보안 측면에서)
    // SSL 보안 프로토콜이 적용된 네트워크는 접속시 https://를 사용 -> 적용이 안된 네트워크는 http://를 사용
    // 서버 도메인이 https://로 시작하면 ATS보안을 적용하지 않아도 됨
    // http://로 시작하면 반드시 ATS보안을 적용하여야 함
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        getData() // URL과 관련
    }
    func getData(){
        if let url = URL(string:movieURL){ // Optional Binding -> 넘겨받은 URL형식이 잘못되었을 경우를 생각하여 옵셔널로
            let session = URLSession(configuration: .default) // 일은 세션에서 수행
            let tesk = session.dataTask(with: url) { (data, response, error) in //네트워크에서 가장 중요한 부분, 세션이 일하는 과정
                if error != nil{ // 오류가 있다면 실행
                    print(error!)
                    return
                }
                if let JSONdata = data{ //Optional Binding
                    //print(JSONdata, response!) //response의 내용은 보내온 Data에 대한 설명이 들어있다.
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    let decoder = JSONDecoder()
                    do{
                        let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                        //그냥 MovieData라고 넣으면 자료형타입만 넣는것이다. 반드시 .self로 변수 값을 넣어주어야한다.
                        //.decode()는 Dacodable한 자료형만 출력하기때문에, 위에서 구조체를 Codable로 지정하였다.
                        self.movieData = decodedData //self.을 쓰는 것은, 같은 클래스내에 있는 것을 쓴다는 의미
                            // closure안에서 객체의 변수 또는 함수에 접근할 때, 반드시! self를 붙여서 사용
                        DispatchQueue.main.async { //UI관련 소스는 main thread에서 처리하라는 의미
                            self.table.reloadData()
                        }
                    }catch{
                        print(error)
                    }
                }
            }
                tesk.resume()//resume의 의미는 재실행이다. 그 이유는, 위에있는 dataTask메서드는 작성한 코드내용만 수행하고 중단되기때문
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
            cell.movieName.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
            //print(indexPath.description, separator: " ", terminator: " ")//단순히 cell을 출력할때, 지정된 크기만큼 작업이 수행됨을 알아보기위한 코드
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(name[indexPath.row])
        }
    }
    
