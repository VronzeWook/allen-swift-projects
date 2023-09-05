import UIKit

// 요청 URL
let movieURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9ea58b9d8185b75777a951de42ba7c1d&targetDt=20120101"

// URL 구조체 생성
let structUrl = URL(string: movieURL)!

// URL Session 생성
//let ssesion = URLSession(configuration: .default)
let mySession = URLSession.shared // 싱글톤 객체 생성

let dongTask = mySession.dataTask(with: structUrl) { data, response, error in
    if error != nil{
        print(error!)
        return
    }
    
    if let safeData = data {
        print(String(decoding: safeData, as: UTF8.self))
    }
}// .resume()

dongTask.resume()
