//
//  MemberListManager.swift
//  MemberList
//
//  Created by 이동욱 on 2023/11/23.
//

import Foundation

final class MemberListManager {
    
    private var membersList: [Member] = []
    
    func makeMembersListDatas(){
        membersList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-7777-7777", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-5151-2525", address: "하와이"),
            Member(name: "배트맨", age: 40, phone: "010-3333-1414", address: "고담시티"),
            Member(name: "조커", age: 40, phone: "010-4321-4124", address: "고담시티")
        ]
    }
    
    // 전체 멤버 리스트 반환
    func getMembersList() -> [Member] {
        return membersList
    }
    
    // 새로운 멤버를 리스트에 추가
    func makeNewMember(_ member: Member){
        membersList.append(member)
    }
    
    // 기존 index번 멤버 정보를 member 정보로 갱신
    func updateMemberInfo(index: Int, _ member: Member){
        membersList[index] = member
    }
    
    // 특정 멤버 얻기(굳이 필요 x , 서브스크립트 구현해보기)
    subscript(index: Int) -> Member{
        get{
            return membersList[index]
        }
        set{
            membersList[index] = newValue
        }
    } 
    
}
