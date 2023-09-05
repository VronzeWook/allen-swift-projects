//
//  Member.swift
//  MemberList
//
//  Created by 이동욱 on 2023/11/22.
//

import UIKit

protocol MemberDelegate: AnyObject {
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member)
}

struct Member {
    
    // UIImage 사용
    lazy var memberImage: UIImage? = { // 나중에 메모리가 생겨, 굳이 이미지가 없다면 메모리 절약
        guard let name = name else{
            return UIImage(systemName: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumbers: Int = 0
    
    let memberId: Int // 외부에서 변경 불가능하도록 let으로 선언
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 생성자 구현
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        // 자동 순번
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성의 정수값 + 1
        Member.memberNumbers += 1
    }
    
}
