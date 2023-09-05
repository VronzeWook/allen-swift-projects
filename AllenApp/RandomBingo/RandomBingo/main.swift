//
//  main.swift
//  RandomBingo
//
//  Created by 이동욱 on 2023/10/12.
//

import Foundation

var computerChoice: Int = Int.random(in: 1...100)
var myChoice: Int = 0

while true{
    var userInput = readLine() // 문자열로 입력
    
    if let input = userInput{ // 옵셔널 문자열에서 옵셔널 바인딩
        if let number = Int(input){ // 문자열을 인트형 변수로
            myChoice = number // 내 선택에 대입
        }
    }
    
    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("BinGo")
        break
    }
}
