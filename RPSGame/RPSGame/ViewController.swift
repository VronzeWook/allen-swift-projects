//
//  ViewController.swift
//  RPSGame
//
//  Created by 이동욱 on 2023/10/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    // 위쪽은 변수(속성)
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째/두번째 이미지뷰에 준비 이미지를 띄움
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄움
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"

    }
    // 아래쪽은 함수(메서드)

    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보를 선택해서 정보 저장해야됨
        //guard let title = sender.currentTitle else{
        //     return
        //}
        
        let title = sender.currentTitle!
        
        switch title{
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 컴퓨터가 랜덤 선택한 것의 이미지와 레이블 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 내가 선택한 것의 이미지와 레이블 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 선택된 정보를 컴퓨터가 선택한 정보랑 비교를 해서 승패 판단/표시
        if comChoice == myChoice {
            mainLabel.text = "비겼따이."
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼따이!"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼따이!"
        } else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼따이!"
        } else{
            mainLabel.text = "졌따이..."
        }

    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 컴퓨터가 다시 처음 준비 상태를 이미지 뷰와 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        myImageView.image = UIImage(named: "ready.png")
        myChoiceLabel.text = "준비"
        // 승패를 다시 선택하세요 라는 문자열로 변경
        mainLabel.text = "선택하세요"
        // 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
}
