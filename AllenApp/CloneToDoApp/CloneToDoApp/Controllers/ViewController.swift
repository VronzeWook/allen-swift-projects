//
//  ViewController.swift
//  CloneToDoApp
//
//  Created by 이동욱 on 2024/01/10.
//

import UIKit

class ViewController: UIViewController {

    // TableView 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // 모델 (저장하는 정보를 관리하는 코어데이터)
    let toDoManager = CoreDataManager.shared // 실행 시 하나만 생성됨 (싱글톤)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        
        
    }
    
    // 화면이 나타날 때마다 테이블뷰 리로드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // 네비게이션바 셋업
    func setupNaviBar() {
        self.title = "메모"
        
        // 네비게이션 버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        // 네비게이션 버튼 색 설정
        plusButton.tintColor = .black
        // 네비게이션 바에 버튼 할당
        navigationItem.rightBarButtonItem = plusButton
    }

    // 테이블뷰 셋업
    func setupTableView() {
        tableView.dataSource = self // 대리자 설정
        tableView.delegate = self
        tableView.separatorStyle = .none // 분리 스타일
    }
    
    
    
    
    
    
    
    
    @objc func plusButtonTapped() {
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        // let toDoData = toDoManager.getToDoListFromCoreData()
        // cell.toDoData = toDodata[indexPath.row]
        
        // cell.updateButtonPressed = { [weak self] (senderCell
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
