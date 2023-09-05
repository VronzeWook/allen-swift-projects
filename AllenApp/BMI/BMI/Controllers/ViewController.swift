//
//  ViewController.swift
//  BMI
//
//  Created by 이동욱 on 2023/10/27.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력하셈"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력하셈"
        weightTextField.placeholder = "kg단위로 입력하셈"
        
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        print(#function)
        // 키와 몸무게 값을 가져와서 BMI 값을 도출
//        guard let height = heightTextField.text, let weight = weightTextField.text else {return}
//        bmiManager.calculateBMI(height: height, weight: weight)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키랑 몸무게 입력하셈!!!"
            mainLabel.textColor = UIColor.red
            return false
        }
        mainLabel.text = "키랑 몸무게를 입력해 주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.modalPresentationStyle = .fullScreen
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true // 글자 입력 허용
        }
        return false // 글자 입력 비허용
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 텍스트필드를 모두 종료 (키보드 내리기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        }
        // 두 번째 텍스트 필드 넘어가기
        else if heightTextField.text != "" {
            // 두 번째 텍스트 필드를 응답 객체로 설정
            weightTextField.becomeFirstResponder()
            return true
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
