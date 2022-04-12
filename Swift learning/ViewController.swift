//
//  ViewController.swift
//  Swift learning
//
//  Created by Ethan on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!

//  ViewDidLoad
//  뷰의 로딩이 완료 되었을 때 시스템에 의해 자동으로 호출되기 때문에, 일반적으로 리소스를 초기화하거나 초기화면을 구성하는 용도로 주로 사용. 화면이 처음 만들어질 때 한 번만 실행되므로, 처음 한 번만 실행해야하는 초기화 코드 작성
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do Someting
    }
//  ViewWillAppear
//  뷰가 나타나기 직전에 항상 실행이 되기 때문에 다른뷰로 갔다가 돌아올 때 하고 싶은 작업을 여기서 함
//  ViewDidAppear
//  뷰가 나타난 뒤에 실행. 데이터를 받아서 화면에 뿌려주거나 애니메이션 등의 작업
//  ViewWillDisappear
//  뷰가 사라지기 직전에 실행
//  ViewDidDisappear
//  뷰가 사라지고 난 뒤에 실행
    
    
    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
}

