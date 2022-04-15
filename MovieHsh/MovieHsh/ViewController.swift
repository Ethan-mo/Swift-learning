//
//  ViewController.swift
//  MovieHsh
//
//  Created by Ethan on 2022/04/14.
//

import UIKit

//배열에 있는 항목을 테이블 뷰에 표시
let name = ["aaa","bbb","ccc","ddd","eee"]
//https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4f9b60b506fdae876be3f25d2a90d2cc&targetDt=20220413

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = name[indexPath.row] //indexPath.description
        //print(indexPath.description, separator: " ", terminator: " ")//단순히 cell을 출력할때, 지정된 크기만큼 작업이 수행됨을 알아보기위한 코드
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(name[indexPath.row])
    }
}

