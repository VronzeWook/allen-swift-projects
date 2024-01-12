//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이동욱 on 2023/10/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNumber: Int = Int.random(in: 1...10)
    var selectNumber: Int = Int.random(in: 1...10)
    
    //처음 시작
    override func viewDidLoad() {
        super.viewDidLoad()
        //mainLabel에 "선택하세요"라고 표시
        mainLabel.text = "선택하세요"
        //numberLabel은 빈문자열 ""
        numberLabel.text = ""
        //컴퓨터가 랜덤 숫자(정답) 1 ~ 10 선택
        comNumber = Int.random(in: 1...10)
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 버튼의 숫자를 가져옴
        guard let numberTemp = sender.currentTitle
        else {return}
        // 아래 레이블 숫자가 누른 버튼의 숫자로 변함
        numberLabel.text = numberTemp
        // 선택한 숫자를 변수에 저장 (선택 사항)
        guard let selectNumberTemp = Int(numberTemp)
        else {return}
        selectNumber = selectNumberTemp
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //comNumber와 내가 선택한 숫자를 비교
        var result: String
        if comNumber > selectNumber {
            result = "Up"
        } else if comNumber < selectNumber {
            result = "Down"
        }
        else{
            result = "Bingo😎"
        }
        //UP/DOWN/BINGO을 mainLabel에 출력
        mainLabel.text = result
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // mainLabel에 "선택하세요" 출력
        mainLabel.text = "선택하세요"
        // comNumber 랜덤 재설정
        comNumber = Int.random(in: 1...10)
        // 숫자 테이블 빈문자열 ""
        numberLabel.text = ""
    }
    

}

