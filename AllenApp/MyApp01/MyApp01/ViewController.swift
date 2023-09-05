//
//  ViewController.swift
//  MyApp01
//
//  Created by 이동욱 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    //InterfaceBuilder 배출구 <--
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    //App의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "방가방가"
    }

    //InterfaceBuilder 동작 -->
    @IBAction func buttonPressed(_ sender: UIButton) {
        
       // myButton.backgroundColor = UIColor.green
       // myButton.setTitleColor(.black, for: UIControl.State.normal)
        
        if mainLabel.text == "방가방가" {
            mainLabel.text = "안녕하세요"
        }
        else{
            mainLabel.text = "방가방가"
        }

        // mainLabel.backgroundColor = UIColor.yellow
        // mainLabel.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) //#colorLiteral(
        // mainLabel.textAlignment = NSTextAlignment.right
    }
    

}

