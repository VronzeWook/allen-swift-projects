//
//  main.swift
//  Swift_Chapter04_230906
//
//  Created by 이동욱 on 2023/09/06.
//

import Foundation

//타입 추론
var name = "Kwanhee" //자동으로 String 할당

//타입 별칭
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100
var year: YourInt = 2023

//모두 Int형이므로 대입 가능
print("age: \(age)  year: \(year)")
year = age
print("age: \(age)  year: \(year)")

let month: Int = 7
let percentage: MyDouble = 99.9


//튜플
var person: (String, Int, Double) = ("yagom", 100, 182.5)
print("이름: \(person.0)  나이: \(person.1) 키: \(person.2)")
person.1 = 99
person.2 = 190.2
print("이름: \(person.0)  나이: \(person.1) 키: \(person.2)")

//튜플 요소 이름 지정
var newPerson: (name: String, age: Int, height: Double) = ("DongWook", 27, 170)
print("이름: \(newPerson.name)   나이: \(newPerson.age)    키: \(newPerson.height)")
newPerson.name = "LeeDongWook"
print(newPerson.0)//기존처럼 인덱스 사용 가능

//튜플 별칭 지정
typealias PersonTuple = (name: String, age: Int, height: Double)
var minsu: PersonTuple = ("MinSu", 18, 177.9)
let eric: PersonTuple = ("Eric", 20, 158.5)
print("이름: \(minsu.name)   나이: \(minsu.age)    키: \(minsu.height)")
print("이름: \(eric.name)   나이: \(eric.age)    키: \(eric.height)")


//배열
var names1: Array<String> = ["DWook", "HKyang", "KSung", "MYeon"]
var names2: [String] = ["DW", "HK", "KS", "MY"]

var emptyArray1: [Any] = [Any]() //Any요소를 가지는 빈 배열
var emptyArray2: [Any] = Array<Any>()
var emptyArray3: [Any] = []
print("is emptyArray?")
print(emptyArray1.isEmpty)
print(emptyArray2.isEmpty)
print(emptyArray3.isEmpty)
print("Name1 Count: \(names1.count)")

//배열의 사용
print(names1[3])
names1[1] = "Haily"
print(names1)

//append()
names1.append("LeeDigi")
print(names1)
names1.append(contentsOf: ["KwangBae","Bori"])
print(names1)

//insert()
names1.insert("ChunGeum", at:5)
print(names1)
names1.insert(contentsOf: ["DuDu", "BoBo"], at:5)
print(names1)

//firstIndex()
print(names1.firstIndex(of: "LeeDigi"))
print(names1.firstIndex(of: "DoDo")) //Any로 업캐스팅 되어서 Optional을 잃을 수도 있다는 경고
print(names1.first)
print(names1.last)

let firstItem: String = names1.removeFirst()
let lastItem: String = names1.removeLast()
let indexZeroItem = names1.remove(at: 0)

print(firstItem) //삭제된 첫번째 요소
print(lastItem) //삭제된 마지막 요소
print(indexZeroItem) //인덱스 0번의 요소
print(names1[1...3])


//딕셔너리
typealias StringIntDictionary = [String: Int]
var numberForName1: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2: [String: Int] = [String: Int]()
var numberForName3: StringIntDictionary = StringIntDictionary()
var numberForName4: [String: Int] = [:]
var numberForName5: [String: Int] = ["Dong": 27, "Kyang": 27, "Digi": 1, "Chungeum": 3]
print(numberForName5)
print(numberForName5.isEmpty)
print(numberForName5.count)

print(numberForName1["Digi"])
print(numberForName1["DuDU"])

numberForName1["max"] = 999
print(numberForName1["max"])

print(numberForName1.removeValue(forKey: "Chungeum"))
print(numberForName1.removeValue(forKey: "Chungeum"))
print(numberForName1["Chungeum", default: 0])


//세트
var setNames1: Set<String> = Set<String>()
var setNames2: Set<String> = []
var setNames3: Set<String> = ["Dong", "Kyang", "MY", "KS"]
var numbers = [100, 200, 300] //Set을 지정해주지 않으면 Default는 Array
print(type(of: numbers))
print(setNames1.isEmpty)
print(setNames3.count)

//세트 활용
setNames3.insert("DG")
print(setNames3.count)
print(setNames3.remove("Dong"))
print(setNames3.count)
print(setNames3.remove("Dong"))
print(setNames3)

//세트 활용 - 집합연산
let englishClassStudents: Set<String> = ["Dong", "Kyang", "MY", "KS"]
let koreanClassStudents: Set<String> = ["AA", "Kyang", "BB", "KS"]
//교집합 {"Kyang", "KS"}
let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)
//여집합의 합(배타적 논리합) {"Dong", "AA", "MY", "BB"}
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)
//합집합 {"Dong", "Kyang", "AA", "MY", "BB", "KS"}
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)
//차집합 {"Dong", "MY"}
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)

print(intersectSet)
print(symmetricDiffSet)
print(unionSet)
print(subtractSet)

//세트 활용 - 포함관계 연산
let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

print(새.isDisjoint(with: 포유류)) //서로 베타적인가
print(새.isSubset(of: 동물)) //새가 동물의 부분집합인가
print(동물.isSuperset(of: 새)) //동물이 새의 전체집합인가
print(동물.isSuperset(of: 포유류)) //동물이 포유류의 전체집합인가


//열거형
enum School {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

/*
 enum Schoole {
 case primary, case elementary, case middle, case high, case college, case university, case graduate
 }
*/

var highestEducationLevel: School = School.university
//var highestEducationLevel: School = .university
highestEducationLevel = .graduate

//열거형의 원시 값 지정과 사용
enum SchoolRaw: String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEduLevel: SchoolRaw = SchoolRaw.university
print("저의 최종학력은 \(highestEduLevel.rawValue)")

enum WeekDays: Character{
    case mon = "월"; case tue = "화"; case wed = "수"; case thu = "목"; case fri = "금"; case sat = "토"; case sun = "일"
}

let today: WeekDays = WeekDays.wed
print(today.rawValue)

//열거형의 원시 값 일부 지정 및 자동 처리
enum SchoolAuto: String{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

let autoHighestEducationLevel: SchoolAuto = SchoolAuto.university
print("저의 최종 학력은 \(autoHighestEducationLevel) 입니다.") //자동으로 String 원시값 부여 (이전 원시 값이 정수라면 정수값 부여)

enum Numbers: Int {
    case zero
    case one
    case two
    case three
    case ten = 10
}
//정수 값으로 하나만 지정해줘도 나머지도 0부터 자동으로 정수 할당
print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.three.rawValue), \(Numbers.ten.rawValue)")

//원시값을 통한 열거형 초기화
let primary = SchoolRaw(rawValue: "유치원")
let graduate = SchoolRaw(rawValue: "석박사")
let one = Numbers(rawValue: 1)
let three = Numbers(rawValue: 3)
print("\(primary), \(graduate), \(one), \(three)") //올바르지 않은 원시 값을 통해 생성하려고 하면 nil반환

//연관 값
/*
enum MainDish{
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}
*/
//여기서 연관 값을 한정하려면 연관 값도 enum을 이용해서 만들어준다
/*
enum PastaTaste{
    case cream, tomato
}

enum PizzaDough{
    case cheeseCrust, thin, original
}

enum PizzaTopping{
    case peperoni, cheese, bacon
}

enum MainDish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.cream)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
print(dinner)
*/

//항목 순회
enum SchoolRotation: CaseIterable{
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [SchoolRotation] = SchoolRotation.allCases
print(allCases)

//원시 값을 가지는 열거형의 항목 순회
enum SchoolRotation2: String, CaseIterable{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let allCases2: [SchoolRotation2] = SchoolRotation2.allCases
print(allCases2)

//available 속성을 갖는 열거형의 항목 순회
enum SchoolAvailable: String, CaseIterable{
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [SchoolAvailable]{
        let all: [SchoolAvailable] = [.primary,
                                      .elementary,
                                      .middle,
                                      .high,
                                      .college,
                                      .university]
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}
//실행 환경에 따라 다른 결과
let allCasesAvailable: [SchoolAvailable] = SchoolAvailable.allCases
//print(allCasesAvailable)

//연관 값을 갖는 열거형의 항목 순회
/* complie error 이유 잘 모르겠음, 나중에 확인
enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case peperoni, cheese, bacon
}

enum MainDish: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
        + PizzaDough.allCases.reduce([]) {(result, dough) -> [MainDish] in
            result + PizzaTopping.allcases.map { (topping) -> MainDish in
                MainDish.pizza(dough: dough, topping: topping)<#T##nextPartialResult: (Result, PizzaDough) throws -> Result##(Result, PizzaDough) throws -> Result##(_ partialResult: Result, PizzaDough) throws -> Result#>)
            }
            + [true, false].map(MainDish.chiken)
            + [MainDish.rice]
        }
}
*/

//일부 항목에만 순환 열거형 선언
/*
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
*/
//열거형 자체에 순환 열거형 선언

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let multi = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(multi)
print("( 5 + 4 ) * 2 = \(result)")

//비교 가능한 열거형의 사용
enum Condition: Comparable{
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else{
    print("당신의 상태가 더 좋군요")
}

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)

