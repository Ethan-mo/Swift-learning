//
//  ViewController.swift
//  Swift learning
//
//  Created by Ethan on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Hello_라벨1 : UILabel!
    @IBOutlet var 이름_txt인풋1 : UITextField!
    // 초반 설정으로, Nil이 기본으로 들어있는 상황이다.
    
    //Interface Builder Outlet(변수, 프로퍼티)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do Someting
    }
    @IBAction func 버튼1(UI형태 sender: UIButton){
        //Interface Builder Action(함수, 메서드)
        Hello_라벨1.text = "Hello, " + 이름_txt인풋1.text!
    }
}

