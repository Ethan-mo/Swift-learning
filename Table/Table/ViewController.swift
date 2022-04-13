//
//  ViewController.swift
//  Table
//
//  Created by Ethan on 2022/04/13.
//
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // UI TVD에는 필수 메서드가 없기 때문에, 채택과 동시에 아무런 위험표시가 뜨지 않는다.
    // UI TVDS에는 필수로 구현해야하는 메서드가 있기 때문에 위험표시가 뜬다.
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
    }
    // 필수 메서드는 아니지만, 섹션을 추가하기 위해 만든 메서드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    // UI 테이블 뷰 데이터 소스 프로토콜에서 필수로 구현해야하는 메서드 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //numberOfRowsInSection은 section에서 row의 개수를 의미
        return 5 //여기가 생략이 되어있다면, 1개의 section에 1개의 row를 부여한다. row(행)와 cell(셀)은 같은 의미이다.
    }
    // UI 테이블 뷰 데이터 소스 프로토콜에서 필수로 구현해야하는 메서드 2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "MyCell")
//        //let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")  -> .init은 생략할 수 있다.
//        cell.textLabel?.text = "\(indexPath.row)" //여기에 있는 textLabel은 UITableViewCell.init()안에 .default에서 생성된 프로퍼티이다.
//        cell.detailTextLabel?.text = indexPath.description //description은 현재 섹션의 몇번째 row인지 2차원 배열형태로 출력해준다.
//        cell.imageView?.image = UIImage(named: "smile.png")
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.myLabel.text = indexPath.description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

