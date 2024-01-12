//
//  LoginViewController.swift
//  PracticeApp05
//
//  Created by 이동욱 on 2024/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var pushButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
        
    }
    
    func makeUI(){
        view.addSubview(pushButton)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pushButton.widthAnchor.constraint(equalToConstant: 120),
            pushButton.heightAnchor.constraint(equalToConstant: 45),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func nextButtonTapped() {
        
        // 전화면의 isLoggedIn속성에 접근하기 ⭐️
        if let presentingVC = presentingViewController { // 옵셔널 바인딩
            let tabBarCon = presentingVC as! UITabBarController   // 탭바에 접근하기
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController  // 네비게이션바에 접근하기
            let firstVC = nav.viewControllers[0] as!
            ViewController  // FirstVC에 접근하기
            firstVC.isLogin.toggle()  // 로그인 되었다고 상태 변화시키기 (실제 앱에서 이렇게 구현할 일은 없음)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
