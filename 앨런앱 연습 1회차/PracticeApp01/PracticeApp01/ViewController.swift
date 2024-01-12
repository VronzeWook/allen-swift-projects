//
//  ViewController.swift
//  PracticeApp01
//
//  Created by 이동욱 on 2024/01/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mainLabel: UILabel!
    var timer = Timer()
    var number = 0
    let systemSoundID: SystemSoundID = 1016
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        slider.value = 0.5
        number = 0
        mainLabel.text = "초를 선택하세요."
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(slider.value * 60)
        mainLabel.text = "\(number)초"
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        configureUI()
        number = 0
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        print("start \(number)초")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerGoing), userInfo: nil, repeats: true)
    }

    @objc func timerGoing(){
        if number > 0{
            number -= 1
            slider.value = Float(number)/Float(60)
            mainLabel.text = "\(number)초"
            print("\(number)초")
        } else {
            timer.invalidate()
            slider.value = 0
            mainLabel.text = "0초"
            print("땡")
            AudioServicesPlaySystemSound(systemSoundID)
        }
    }
    
}

