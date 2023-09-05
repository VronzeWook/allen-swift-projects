import UIKit


// 서버에서 주는 데이터의 형태
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult: Codable {
struct BoxOfficeResult: Codable{
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}

struct Movie {
    let name: String
    let openDate: String
}



// Data 분석을 위한 함수
func parseJSON1(_ movieData: Data) -> [DailyBoxOfficeList]? {
    do{
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(MovieData.self, from: movieData)
        return decodedData.boxOfficeResult.dailyBoxOfficeList
    }
    catch{
        return nil
    }
}


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
    
    guard let safeData = data else {
        return
    }
    
    var movieArray = parseJSON1(safeData)
    dump(movieArray!)
//    print(String(decoding: safeData, as: UTF8.self))
}// .resume()

// 작업 시작
dongTask.resume()
