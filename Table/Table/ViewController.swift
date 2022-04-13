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
    
    // UI 테이블 뷰 데이터 소스 프로토콜에서 필수로 구현해야하는 메서드 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //numberOfRowsInSection은 section에서 row의 개수를 의미
        return 5 //여기가 생략이 되어있다면, 1개의 section에 1개의 row를 부여한다. row(행)와 cell(셀)은 같은 의미이다.
    }
    // UI 테이블 뷰 데이터 소스 프로토콜에서 필수로 구현해야하는 메서드 2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "MyCell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

}

