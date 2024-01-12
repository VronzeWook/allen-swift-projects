//
//  CoreDataManager.swift
//  CloneToDoApp
//
//  Created by 이동욱 on 2024/01/12.
//

import UIKit
import CoreData

// MARK: - To do 관리하는 매니저 (코어 데이터 관리)

final class CoreDataManager {
    
    // 싱글톤으로 만들기
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시 저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    
func getToDoListFromCoreData() -> [ToDoData] {
        var toDoList: [ToDoData] = []
        return  toDoList
    }
    
    
    
    
    
    
    
}
