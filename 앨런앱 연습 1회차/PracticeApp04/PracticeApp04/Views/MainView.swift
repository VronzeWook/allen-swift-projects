//
//  MainView.swift
//  PracticeApp04
//
//  Created by 이동욱 on 2024/01/22.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - 키 입력 텍스트필드와 라벨
    private lazy var heightStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        stv.axis = .horizontal
        stv.alignment = .fill
//      stv.distribution = .fillEqually
        stv.spacing = 10
        return stv
    }()
    
    private var heightLabel: UILabel = {
        let label = UILabel()
        label.frame.size.width = 80
        label.text = "키"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var heightTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 35
        tf.backgroundColor = .white // 배경색
        tf.textColor = .black // 글자 색
        tf.tintColor = .white // 주로 배경과 글자를 제외한 나머지의 색상
        tf.autocapitalizationType = .none // 자동으로 앞글자를 대문자로
        tf.autocorrectionType = .no // 자동으로 오탈자 고치기
        tf.spellCheckingType = .no // 스펠링 체크
        tf.keyboardType = .decimalPad // 키보드 타입
        tf.clipsToBounds = true // subview가 view의 경계를 넘어가면 잘림
        tf.layer.cornerRadius = 8
        tf.textAlignment = .center
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        tf.placeholder = "cm단위로 입력해주세요"
        return tf
    }()
    
    // MARK: - 몸무게 입력 텍스트 필드와 라벨
    private lazy var weightStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        stv.axis = .horizontal
        stv.alignment = .fill
        //stv.distribution = .equalSpacing
        stv.spacing = 10
        return stv
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        label.frame.size.width = 80
        label.text = "몸무게"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var weightTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 35
        tf.backgroundColor = .white // 배경색
        tf.textColor = .black // 글자 색
        tf.tintColor = .white // 주로 배경과 글자를 제외한 나머지의 색상
        tf.autocapitalizationType = .none // 자동으로 앞글자를 대문자로
        tf.autocorrectionType = .no // 자동으로 오탈자 고치기
        tf.spellCheckingType = .no // 스펠링 체크
        tf.keyboardType = .decimalPad // 키보드 타입
        tf.clipsToBounds = true // subview가 view의 경계를 넘어가면 잘림
        tf.layer.cornerRadius = 8
        tf.textAlignment = .center
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        tf.placeholder = "kg단위로 입력해주세요"
        return tf
    }()
    
    // MARK: - 입력 안내창
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.frame.size.height = 35
        label.text = "키와 몸무게를 입력해 주세요"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - 스택뷰(키입력 창 + 몸무게 창 + 안내창)
    private lazy var stackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [infoLabel, heightStackView, weightStackView])
        stv.axis = .vertical
        stv.alignment = .fill
        stv.distribution = .equalSpacing
        stv.spacing = 20
        return stv
    }()
    
    // MARK: - 계산 버튼
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("BMI 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - 편의용 변수
//    private let textViewHeight: CGFloat = 48
//    lazy var emailTextFieldLabelCenterYconstraint = emailTextFieldLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
//    lazy var passwordTextFieldLabelCenterYconstraint =
//        passwordTextFieldLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    private let stackViewLeadingAnchor: CGFloat = 250
    private let calculateButtonBottomAnchor: CGFloat = -100

    
    // MARK: - 생성자 재정의
    override init(frame: CGRect) {
           super.init(frame: frame)
//        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
           // 순서 중요
           setupUI() // self 설정
           addViews() // addSubviews
           setConstraints() // 오토레이아웃 적용
       }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }// self 설정
    
    func addViews(){
        [stackView, calculateButton].forEach { addSubview($0) }
    } // addSubviews
    
    
    func setConstraints(){
        heightLabelConstraints()
        heightTextFieldConstraints()
        weightLabelConstraints()
        weightTextFieldConstraints()
        infoLabelConstraints()
        stackViewConstraints()
        calculateButtonConstraints()
    } // 오토레이아웃 적용
    
    func heightLabelConstraints(){
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightLabel.heightAnchor.constraint(equalToConstant: 35),
            heightLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func heightTextFieldConstraints(){
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func weightLabelConstraints(){
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightLabel.heightAnchor.constraint(equalToConstant: 35),
            weightLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func weightTextFieldConstraints(){
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func infoLabelConstraints(){
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.heightAnchor.constraint(equalToConstant: 35),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: stackViewLeadingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 35 * 3 + 40)
        ])
    }
    
    func calculateButtonConstraints() {
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: calculateButtonBottomAnchor),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    @objc private func textFieldEditingChanged(_ textField: UITextField){
        // 첫 글자에 공백 입력을 막기
        if textField.text?.count == 1{
            if textField.text == " "{
                textField.text = ""
                return
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

//extension MainView: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
