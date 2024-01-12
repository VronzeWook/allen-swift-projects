//
//  ViewController.swift
//  PracticeApp04
//
//  Created by 이동욱 on 2024/01/22.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {

    private let mainView = MainView()
    
    var bmiManager = BMICalculatorManager()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        setupDelegate()
    }

    func setupDelegate(){
        mainView.heightTextField.delegate = self
        mainView.weightTextField.delegate = self
    }
  
    
    
    func setupAddTarget(){
        mainView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    // 조건 만족 시 다음 화면으로
    @objc func calculateButtonTapped() {
        guard let hText = mainView.heightTextField.text else{ return }
        guard let wText = mainView.weightTextField.text else{ return }
        
        if hText == "" {
            alertPresent(message: "키를 입력해주세요!")
            return
        } else if wText == "" {
            alertPresent(message: "몸무게를 입력해주세요!")
            return
        }

        // 데이터 생성
        let tempBMI = bmiManager.getBMI(height: hText, weight: wText)
        // 이동할 화면 생성
        let rvc = ResultViewController()
        // 데이터 전달
        rvc.bmi = tempBMI
        // 화면 표시 방식 설정
        rvc.modalPresentationStyle = .fullScreen
        // 화면 이동 실행
        self.present(rvc, animated: true)
        
        // 텍스트 필드 초기화
        mainView.heightTextField.text = ""
        mainView.weightTextField.text = ""
    }

    func alertPresent(message m: String){
        let alert = UIAlertController(title: "입력 부족", message: m, preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("ㅇㅇ")
        }
        alert.addAction(success)
        self.present(alert, animated: true, completion: nil)
    }

}

//extension ViewController: UITextFieldDelegate {
//
//}
