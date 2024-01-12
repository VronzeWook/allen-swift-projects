//
//  ViewController.swift
//  PracticeApp05
//
//  Created by 이동욱 on 2024/01/23.
//

import UIKit

class ViewController: UIViewController {

    
    var isLogin: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLogin {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
//        isLogin = true
    }
    
    
    func makeUI() {
        view.backgroundColor = .gray
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main1515"
        

    }

    
    
    
    
}

