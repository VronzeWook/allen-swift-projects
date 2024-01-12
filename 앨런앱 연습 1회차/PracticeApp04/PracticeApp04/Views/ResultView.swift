//
//  ResultView.swift
//  PracticeApp04
//
//  Created by 이동욱 on 2024/01/22.
//

import UIKit

class ResultView: UIView {
    
    // MARK: - 결과값 표시 스택뷰
    private lazy var resultStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [infoLabel, resultLabel, adviceLabel])
        stv.axis = .vertical
        stv.alignment = .fill
//        stv.distribution = .fillEqually
        stv.spacing = 10
        return stv
    }()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.frame.size.width = 200
        label.text = "BMI 결과값"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.frame.size.width = 200
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        label.clipsToBounds = true
        
        label.layer.cornerRadius = 8
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
  
    
    var adviceLabel: UILabel = {
        let label = UILabel()
        label.frame.size.width = 200
        label.text = "Advice"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
   
    // MARK: - 다시 계산하기 버튼 (첫 화면으로 돌아가기
    lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("다시 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - 편의용 변수
    
    
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
        [resultStackView, recalculateButton].forEach { addSubview($0) }
    } // addSubviews
    
    
    func setConstraints(){
        resultStackViewConstraints()
        infoLabelConstraints()
        resultLabelConstraints()
        adviceLabelConstraints()
        recalculateButtonConstraints()
    } // 오토레이아웃 적용
    
 
    func resultStackViewConstraints(){
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultStackView.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            resultStackView.heightAnchor.constraint(equalToConstant: 150),
            resultStackView.widthAnchor.constraint(equalToConstant: 200),
            resultStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func infoLabelConstraints(){
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: resultStackView.topAnchor, constant: 0),
            infoLabel.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor, constant: 0),
            infoLabel.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor, constant: 0),
            infoLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func resultLabelConstraints(){
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            resultLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            resultLabel.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor, constant: 0)
//            resultLabel.bottomAnchor.constraint(equalTo: adviceLabel.topAnchor, constant: -10)
        ])
    }
    
    func adviceLabelConstraints(){
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adviceLabel.bottomAnchor.constraint(equalTo: resultStackView.bottomAnchor, constant: 0),
            adviceLabel.leadingAnchor.constraint(equalTo: resultStackView.leadingAnchor, constant: 0),
            adviceLabel.trailingAnchor.constraint(equalTo: resultStackView.trailingAnchor, constant: 0),
            adviceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func recalculateButtonConstraints(){
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recalculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            recalculateButton.heightAnchor.constraint(equalToConstant: 45)
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

