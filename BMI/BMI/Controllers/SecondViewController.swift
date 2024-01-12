//
//  SecondViewController.swift
//  BMI
//
//  Created by 이동욱 on 2023/10/27.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    func makeUI(){

        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("다시 계산하기", for: .normal)
        
        guard let bmiNow = bmi else {return} // 옵셔널 벗기기
        bmiNumberLabel.text = "\(bmiNow.value)"
        adviceLabel.text = bmiNow.advice
        bmiNumberLabel.backgroundColor = bmiNow.matchColor
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
