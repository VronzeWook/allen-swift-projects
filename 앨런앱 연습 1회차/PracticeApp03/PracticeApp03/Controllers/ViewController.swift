//
//  ViewController.swift
//  PracticeApp03
//
//  Created by 이동욱 on 2024/01/20.
//

import UIKit

class ViewController: UIViewController {

    // 로그인 뷰 생성
    private let loginView = LoginView()
    // ViewController의 view에 로그인 뷰 대입
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }

    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        print("로그인 버튼 눌림 다음 동작 실행")
    }
    
    // 리셋 버튼 눌릴 시 얼럿창
    @objc func resetButtonTapped() {
        // 각 속성을 만들고
        let alert = UIAlertController(title: "비밀번호를 바꾸기", message: "비번 바꿀꺼?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("ㅇㅇ")
        }
        let cancel = UIAlertAction(title: "취소", style: .default) { action in
            print("ㄴㄴ")
        }

        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제로 화면 띄우기
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

}

