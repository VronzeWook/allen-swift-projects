//
//  ViewController.swift
//  PracticeApp02
//
//  Created by 이동욱 on 2024/01/15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    func setupDelegate() {
        textField.delegate = self
    }
    
    func setupUI() {
        textField.becomeFirstResponder()
        view.backgroundColor = .gray
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .send
        textField.clearButtonMode = .always
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        resignFirstResponder()
        print("done")
    }
    
}

extension ViewController: UITextFieldDelegate {
    // 화면 밖을 터치했을 때, 텍스트 필드 종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("textField 입력 시작")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("textField 입력 종료")
    }
 
    // 키보드에서 리턴을 눌리는 것을 허락할지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
}
