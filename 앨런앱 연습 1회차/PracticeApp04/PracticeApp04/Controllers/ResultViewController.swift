//
//  ResultViewController.swift
//  PracticeApp04
//
//  Created by 이동욱 on 2024/01/22.
//

import UIKit

final class ResultViewController: UIViewController {

    private let resultView = ResultView()
    
    var bmi: BMI = BMI(value: 0.0, advice: "결과화면 BMI 생성오류", matchColor: UIColor.white)
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        resultView.resultLabel.text = String(bmi.value)
        resultView.adviceLabel.text = bmi.advice
        resultView.resultLabel.backgroundColor = bmi.matchColor
    }
    
    func setupAddTarget(){
        resultView.recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
    }
    
    @objc func recalculateButtonTapped(){
        self.dismiss(animated: true)
    }

}
