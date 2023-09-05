import UIKit

// MARK: - MusicData
struct MusicData: Codable {
    let numberOfResults: Int
    let results: [Music]
    
    enum CodingKeys: String, CodingKey{
        case results
        case numberOfResults = "resultCount"
    }
}

// MARK: - Music
struct Music: Codable {
    let artistName: String?
    let albumName: String?
    let previewUrl: String?
    let songName: String?
    let imageUrl: String
    private let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
}


func getMethod(completionHandler: @escaping ([Music]?) -> Void)  {

    // URL구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?music&term=jazz") else {
        print("Error: cannot create URL")
        completionHandler(nil)
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            completionHandler(nil)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            completionHandler(nil)
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            completionHandler(nil)
            return
        }
            
//        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
//        print(String(decoding: safeData, as: UTF8.self))
        
        do{
            let decoder = JSONDecoder()
            let musicData = try decoder.decode(MusicData.self, from: safeData)
            completionHandler(musicData.results)
            return
        } catch{

        }

    }.resume()     // 시작
}


getMethod { musicArray in
    guard let array = musicArray else {return}
    dump(array)
}
