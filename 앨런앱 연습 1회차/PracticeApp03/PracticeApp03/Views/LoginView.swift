//
//  LoginView.swift
//  PracticeApp03
//
//  Created by 이동욱 on 2024/01/20.
//

import UIKit

final class LoginView: UIView {

    // MARK: - 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailTextFieldLabel)
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear // 배경색
        tf.textColor = .white // 글자 색
        tf.tintColor = .white // 주로 배경과 글자를 제외한 나머지의 색상
        tf.autocapitalizationType = .none // 자동으로 앞글자를 대문자로
        tf.autocorrectionType = .no // 자동으로 오탈자 고치기
        tf.spellCheckingType = .no // 스펠링 체크
        tf.keyboardType = .emailAddress // 키보드 타입
        // 두 텍스트 필드에 모두 입력이 있을 경우, 로그인 버튼 색상 변경
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    private let emailTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return label
    }()
    
    
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    // 비밀번호 입력 전체
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor =  #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)// 배경색
        view.layer.cornerRadius = 5 // 코너 곡률
        view.clipsToBounds = true // 모서리를 둥글게 (위랑 세트)
        view.addSubview(passwordTextField)
        view.addSubview(passwordTextFieldLabel)
        view.addSubview(passwordTextfieldButton)
        return view
    }()
    // 패스워드 입력 텍스트 필드
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
//        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            tf.frame.size.height = 48
            tf.backgroundColor = .clear
            tf.textColor = .white
            tf.tintColor = .white
            tf.autocapitalizationType = .none
            tf.autocorrectionType = .no
            tf.spellCheckingType = .no
            tf.isSecureTextEntry = true
            tf.clearsOnBeginEditing = false
        // 입력될 때마다 체크하며, 비밀번호와 이메일이 모두 입력되 있다면 버튼 색상 변경
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    // 패스워드 라벨(입력 시 변동하는 라벨)
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    // 비밀번호 표시 버튼
    private lazy var passwordTextfieldButton: UIButton = {
        let button = UIButton()
        button.setTitle("표시", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - 로그인 버튼
    // 로그인 버튼이 눌리면 다음 화면이 전달되어야 하므로, ViewController에서 처리해야함
    // 따라서 public으로 선언해서 ViewController에서 addtarget으로 접근할 수 있게 해야함
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5 // 모서리 곡률
        button.layer.borderWidth = 1 // 테두리 두께
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("로그인", for: .normal)
        // 위에서 타이틀을 set해야 한다, 실패 가능성이 있으므로 ?옵셔널로 타이틀 라벨 폰트에 접근
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        return button
    }()
    
    // MARK: - 이메일, 비밀번호, 로그인 StackView
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        stview.spacing = 18 // 요소 간 간격
        stview.axis = .vertical // 수직으로 묵기
        stview.distribution = .fillEqually // 동등하게 채움
        stview.alignment = .fill // 사이드로 채우기
        return stview
    }()
    
    // MARK: - 비밀번호 재설정 버튼
    // 비밀번호 재설정 버튼 또한 ViewController에서 alert창을 띄워줘야하기 때문에 public으로 선언
    var passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    // MARK: - 오토레이아웃 시작
    // 텍스트 필드와 로그인 버튼의 높이 설정
    // 이렇게 설정함으로써, 수정 및 관리가 용이함
    private let textViewHeight: CGFloat = 48
    
    // 오토레이아웃 향후 변경을 위한 변수 (클릭 시 글자 크기 변경)
    lazy var emailTextFieldLabelCenterYconstraint = emailTextFieldLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordTextFieldLabelCenterYconstraint =
        passwordTextFieldLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        // 순서 중요
        setupUI() // self 설정
        addViews() // addSubviews
        setConstraints() // 오토레이아웃 적용
    }
    // UIView에서 생성자를 재정의할 때 필수 생성자 또한 재정의
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 해당 클래스(UIView)의 배경색 설정
    // 텍스트필드 대리자 설정
    func setupUI() {
        backgroundColor = .black
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // 전체 View에 위에 선언한 View들(email, password, login를 묶은 stackview와 비밀번호 재설정 버튼) 올리기
    func addViews() {
        // 배열 각 요소에 대해 함수 실행?
        // self에 대해서 addSubview 실행
        [stackView, passwordResetButton].forEach { addSubview($0) }
    }


    // 각 요소 오토레이아웃 설정 함수 총 호출
    private func setConstraints() {
        emailTextFieldLabelConstraints()
        emailTextFieldConstraints()
        passwordTextFieldLabelConstraints()
        passwordTextFieldConstraints()
        passwordSecureButtonConstraints()
        stackViewConstraints()
        passwordResetButtonConstraints()
    }
    
    // 이메일 텍스트 필드 라벨을 텍스트 필드 뷰에 맞춰서 오토레이아웃 설정
    private func emailTextFieldLabelConstraints() {
        emailTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            // 양옆 조절 후, 위 선언해둔 emailTExtFieldLabelCenterYconstriant 호출
            [emailTextFieldLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
             emailTextFieldLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
             emailTextFieldLabelCenterYconstraint
            ])
    }
    // 이메일 텍스트 필드를 텍스트 필드 뷰에 맞춰서 오토레이아웃 설정
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8)
        ])
        
    }
    // 패스워드 텍스트 필드 라벨을 패스워드 뷰에 맞춰서 오토레이아웃 설정
    private func passwordTextFieldLabelConstraints() {
        passwordTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextFieldLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordTextFieldLabelCenterYconstraint
        ])
    }
    // 패스워드 텍스트 필드를 패스워드 뷰에 맞춰서 오토레이아웃 설정
    private func passwordTextFieldConstraints(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8)
        ])
    }
    // 패스워드 보안 버튼 오토레이아웃 설정
    private func passwordSecureButtonConstraints(){
        passwordTextfieldButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextfieldButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextfieldButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordTextfieldButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8)
        ])
    }
    
    // 스택뷰 오토레이아웃 설정
    
    private func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // self의 요소에 접근
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight * 3 + 36)
        ])
    }
    
    
    private func passwordResetButtonConstraints(){
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }

    
    // MARK: - 로그인 버튼 색상 변경 함수
    @objc private func textFieldEditingChanged(_ textField: UITextField){
        // 첫 글자에 공백 입력을 막기
        if textField.text?.count == 1{
            if textField.text == " "{
                textField.text = ""
                return
            }
        }
        // 이메일, 패스워드 두 텍스트 필드에 글자가 있을 때, 로그인 버튼 색상 변경
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else { // 하나라도 비었다면,
            loginButton.backgroundColor = .clear // 색상을 비우고
            loginButton.isEnabled = false // 버튼 비활성화
            return
        }
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
    
    // MARK: - 비밀번호 가리기 버튼 on/off 함수
    @objc private func passwordSecureModeSetting() {
        // 텍스트필드 내부 구현되어있음
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // MARK: -  화면에 터치가 일어났을 때, 입력을 종료 (키보드 내리기)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}


extension LoginView: UITextFieldDelegate {
    // MARK: - 텍스트필드 편집 시작할때의 설정 - 문구가 위로올라가면서 크기 작아지고, 오토레이아웃 업데이트
    // 텍스트필드 편집이 시작
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            emailTextFieldLabel.font = UIFont.systemFont(ofSize: 11)
            emailTextFieldLabelCenterYconstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            passwordTextFieldLabel.font = UIFont.systemFont(ofSize: 11)
            passwordTextFieldLabelCenterYconstraint.constant = -13
        }
        
        // 실제 레이아웃 변경 -> 애니메이션
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }   
    }
    
    // 텍스트 필드 입력 종료
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            if emailTextField.text == "" {
                emailTextFieldLabel.font = UIFont.systemFont(ofSize: 18)
                emailTextFieldLabelCenterYconstraint.constant = 0
            }
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            if passwordTextField.text == "" {
                passwordTextFieldLabel.font = UIFont.systemFont(ofSize: 18)
                passwordTextFieldLabelCenterYconstraint.constant = 0
            }
        }
        
        // 실제 레이아웃 변경 -> 애니메이션
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    
