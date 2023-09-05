//
//  ViewController.swift
//  LoginProject
//
//  Created by 이동욱 on 2023/10/24.
//

import UIKit

// class는 struct보다 동적 디스패치가 일어나기 때문에 느림
// final 키워드를 붙여서 더이상 상속을 불가능하게 만들고, 다이렉트 디스패치
final class ViewController: UIViewController {

    // MARK: - 이메일을 입력하는 텍스트 뷰
    // private으로 클래스 내부에서만 접근 가능하도록
    // 대부분의 변수는 private을 붙이는게 좋음
    // lazy는 메모리에 올라가는 순서를 늦춤 -> addSubView 사용가능
    private lazy var emailTextFieldView: UIView = {
        let view = UIView() // 클로저 내부에서는 간단히 선언
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel) // 순서대로 화면에 쌓임
        return view
    }()
   
    // "이메일 또는 전화번호" 안내 문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호" // 라벨 텍스트 설정
        label.font = UIFont.systemFont(ofSize: 18) // 폰트 크기 설정
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // 텍스트 색상 설정
        return label
    }()
    
    // 로그인 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true // 영역내로 잘라낸다
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    // 패스워드 텍스트필드의 안내 문구
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.isSecureTextEntry = true // 비밀번호를 가리는 설정
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // 패스워드 "표시"버튼 비밀번호 가리기 기능
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal) // 텍스트 설정
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light) // 크기 설정
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    // MARK: - 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true // 둥글게
        button.layer.borderWidth = 1 // 선의 넓이
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16) // 폰트 변경
        button.isEnabled = false // 버튼 동작 여부
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // 스택 뷰로 묶기
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18 // 요소 간 간격
        st.axis = .vertical   // 세로 or 가로 축 설정
        st.distribution = .fillEqually // axis의 수평방향을 기준으로 내부 요소들을 어떻게 배치할지
        st.alignment = .fill // axis 기준 수직으로 어떻게 정렬할지
       return st
    }()
    
    // 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48

    // 오토레이아웃을 담는 변수 선언
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 텍스트필드의 대리자를 self로 선언
        emailTextField.delegate = self
        passwordTextField.delegate = self
        makeUI()
    }

    
    func makeUI(){
        view.addSubview(stackView)
        view.backgroundColor = UIColor.black
        view.addSubview(passwordResetButton)
        
        // 자동 제약 해제
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // emailInfoLabel 오토레이아웃 설정, 일괄적으로 active 시키는 방법
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8), // emailTextFieldView의 왼쪽을 기준으로 8만큼
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),// emailTextFieldView의 오른쪽 기준으로 8만큼
            //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            // emailTextField 기준 가운데 정렬
            emailInfoLabelCenterYConstraint,
            
            // emailTextField 오토레이아웃 설정
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            
            // passwordInfoLabel 오토레이아웃 설정
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            
            // passwordTextField 오토레이아웃 설정
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            // passwordSecureButton 오토레이아웃 설정
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            // stackView 오토레이아웃 설정
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            // passwordResetButton 오토레이아웃 설정
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }

    // Alert 창 만들기
    @objc func resetButtonTapped(){
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default){ action in
            // 동작
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel){ cancel in
            // 동작
        }
        
        alert.addAction(success)
        alert.addAction(cancel) // alert 위에 Action 추가
        
        present(alert, animated: true, completion: nil) // 어떤 화면에서 다음 화면으로 넘어감
    }
    
    // 표시 버튼이 눌렸을 때
    @objc func passwordSecureModeSetting(){
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // 입력 중 여백을 눌렀을 때, 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 로그인 버튼 동작
    @objc func loginButtonTapped(){
        print("login button pressed")
    }
}

// 확장해서 하면 정리가 깔끔함
// 선택적 요구 사항으로 구현

extension ViewController: UITextFieldDelegate {
    // 텍스트 필드 입력 시작 시
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    //텍스트 필드 입력 종료 시
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            //빈칸이면 원래로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }

    // 이메일, 비밀번호 입력 시 로그인 버튼 색상 변경
    @objc func textFieldEditingChanged(_ textField: UITextField){
        // 입력 문자가 1개일 때, " "가 오면 삭제
        if textField.text?.count == 1 {
            if textField.text?.first == " "{
                textField.text = ""
                return
            }
        }
        // 글자가 있는지 없는지에 따라 버튼 색깔 변경
        guard
            let email = emailTextField.text, !email.isEmpty, // 이메일 텍스트필드에 텍스트가 있고, 비지 않았다면
            let password = passwordTextField.text, !password.isEmpty // 비밀번호 텍스트필드에 텍스트가 있고, 비지 않았다면
        else {
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
}
