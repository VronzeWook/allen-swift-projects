//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이동욱 on 2023/10/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }

    func setup(){
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        
        textField.becomeFirstResponder()
    }
    
    
    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드에 입력 시작")
    }
    
    // 지워질 수 있는지 허락 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드 글자 내용이 (한글자, 한글자) 입력되거나 지워질 때 호출이 되고 허락 여부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let maxLenghth = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLenghth
        
        
        if Int(string) != nil{
            return false
        } else {
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 텍스트 필드의 엔터키가 눌려지면 다음 동작을 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 필드의 입력이 끝날 때 호출 되며, 끝날지 말지 허락 여부
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("유저 입력 완료")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

