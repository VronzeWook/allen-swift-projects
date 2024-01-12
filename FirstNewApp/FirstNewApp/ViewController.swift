//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 이동욱 on 2023/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number: Int = 0
    let systemSoundID: SystemSoundID = 1322
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        // 슬라이더 가운데 세팅
        slider.setValue(slider.maximumValue/2, animated: true)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더 value를 가지고 메인레이블의 텍스트 세팅
        number = Int(sender.value * 60)
        mainLabel.text = "\(number)초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 세팅
        timer?.invalidate() // 기존 실행되던 타이머 비활성화
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ [self] _ in
//            // 반복하고 싶은 코드
//            if number > 0{
//                number -= 1
//                // 슬라이더 줄이기
//                // 레이블 재표시
//                slider.value = Float(number)/Float(60)
//                mainLabel.text = "\(number)초"
//            }
//            else{
//                // 0이 됬을 때 소리발생
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//                //타이머 비활성화
//                timer?.invalidate()
//                //소리
//                AudioServicesPlaySystemSound(systemSoundID)
//            }
//        }
    }
    
    @objc func doSomethingAfter1Second(){
        if number > 0{
            number -= 1
            // 슬라이더 줄이기
            // 레이블 재표시
            slider.value = Float(number)/Float(60)
            mainLabel.text = "\(number)초"
        }
        else{
            // 0이 됬을 때 소리발생
            number = 0
            mainLabel.text = "초를 선택하세요"
            //타이머 비활성화
            timer?.invalidate()
            //소리
            AudioServicesPlaySystemSound(systemSoundID)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        configureUI()
        number = 0
        timer?.invalidate()
    }
}

