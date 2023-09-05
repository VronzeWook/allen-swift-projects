//상수와 변수 선언 해보기
let name: String = "Dongwook"
var age: Int = 100
var job = "iOS Programmer"
let height = 200.5

//상수와 변수에 값 대입
age = 27
//name = "동욱 -> Error 발생
job = "Nothing"
print("제 이름은 \(name)이고 나이는 \(age)세 입니다.\n")


//데이터 타입 기본
print("데이터 타입 기본\n")

//Int와 UInt
print("Int와 UInt")
var integer: Int = -100
let unsignedInteger: UInt = 99
print("Integer_value : \(integer)")
print("UnsignedInt_value : \(unsignedInteger)")
print("Int_Max_Value : \(Int.max)")
print("UnsigendInt_Max_Value : \(UInt.max)")

let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64_Max_Value : \(largeInteger)\nUInt8_Max_Value : \(smallUnsignedInteger)\n")

//진수별 정수 표현
let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100 //2진수로 10진수 28 표현
let octalInteger: Int = 0o34 //8진수로 10진수 28 표현
let hexadecimalInteger: Int = 0x1C //16진수로 28 표현

print("진수별 정수 표현")
print("deciamlInteger : \(decimalInteger)")
print("binaryInteger : \(binaryInteger)")
print("octalInteger : \(octalInteger)")
print("hexadecimalInteger : \(hexadecimalInteger)\n")

//Bool 타입
var boolean: Bool = true
boolean.toggle() // true-false 반전
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("Bool 타입")
print("시간은 무한합니까?: \(isTimeUnlimited)\n")

//Float과 Double
//Float은 32비트 부동소수 표현
//Double은 64비트 부동소수 표현
var floatValue: Float = 1234567890.1 //Float 범위 초과, 상대적 정확도 낮음
let doubleValue: Double = 1234567890.1 //Double 수용 가능, 상대적 정확도 높음
print("Float와 Double")
print("floatValue: \(floatValue)")
print("doubleValue: \(doubleValue)")
print("Changing value float can accommodate")
floatValue = 123456.1
print("modified floatValue: \(floatValue)\n")

//Character
//유니코드9
let alphabetA: Character = "A"
print("Character")
print("print Alpha: \(alphabetA)")
//Unicode could be used as Character value
let commandCharacter: Character = "☺️"
print("print Imoticon: \(commandCharacter)")
let 한글변수이름: Character = "ㄱ"
print("한글의 첫 자음 : \(한글변수이름)\n")

//String
let myName: String = "DongWook Lee"
//Empty String could be made by using initailizer
var introduce: String = String()
introduce.append("My Name is ")
introduce += myName
print("\(introduce)\n")
print("name의 글자 수: \(name.count)")
print("문자열이 비어있습니까? : \(introduce.isEmpty)")
let unicodeScalarValue: String = "\u{2665}"
print("unicodeScalarValue: \(unicodeScalarValue)\n")
print("Various Function of Stirng type")

//연산자를 통한 문자열 결합
let hello: String = "Hello"
let dong: String = "dong"
var greeting: String = hello + " " + dong + "!"
print(greeting)
greeting = hello
greeting += " "
greeting += dong
greeting += "!"
print(greeting)

//연산자를 통한 문자열 비교
var isSameString: Bool = false
isSameString = hello == "Hello"
print(isSameString) //true
isSameString = hello == "hello"
print(isSameString) //false
isSameString = dong == "dong"
print(isSameString)
isSameString = dong == hello
print(isSameString)

//메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix)

hasPrefix = greeting.hasPrefix("Hello")
print(hasPrefix)

hasPrefix = dong.hasPrefix("do")
print(hasPrefix)

hasPrefix = dong.hasPrefix("ng")
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix)

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)

hasSuffix = greeting.hasSuffix("dong")
print(hasSuffix)

hasSuffix = greeting.hasSuffix("dong!")
print(hasSuffix)

hasSuffix = dong.hasSuffix("ng")
print(hasSuffix)

//메서드를 통한 대소문자 변환
var convertedString: String = ""
convertedString = hello.uppercased()
print(convertedString)

convertedString = hello.lowercased()
print(convertedString)

convertedString = dong.uppercased()
print(convertedString)

convertedString = greeting.uppercased()
print(convertedString)

//프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = "안녕"
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString)

//프로퍼티를 통한 문자열 길이 확인
print(greeting.count)
greeting = "안녕하세요"
print(greeting.count)
greeting = "안녕!"
print(greeting.count)

//코드상 여러 줄의 문자열을 직접 쓸 때
greeting = """
안녕하세요 저는 동욱입니다.,
스위프트 잘하고 싶어요!
잘 부탁합니다!
"""
print(greeting)
