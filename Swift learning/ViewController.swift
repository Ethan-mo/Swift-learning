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
        // app실행과 동시에 label의 프레임 규격을 규정하는 방법
        // 1. 한 번에 (UILabel함수를 사용)
        // let l = UILabel(frame: CGRect(x: 10, y: 100, width: 100, height: 50))
        // 2. 따로따로 (다른 속성들도 정의해주기 보기 좋음)
        let l = UILabel()
        l.frame = CGRect(x: 10, y: 100, width: 100, height: 50)
        l.text = "Hello"
        l.textColor = UIColor.red
        l.backgroundColor = .blue   // blue라는 요소를 가져올 구조체/클래스는 'UIColor'밖에 없기때문에 가능
        view.addSubview(l)          // 반드시 이렇게 view에 add해주어야 한다.
        
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
        //lblHello.text = "Hello, " + txtName.text!
        lblHello.text = txtName.text
        //print(txtName.text, lblHello.text)        // console로 출력
        lblHello.textColor = UIColor.red            // 글자를 빨간색으로 출력
    }
}

