//
//  ViewController.swift
//  MemberList
//
//  Created by 이동욱 on 2023/11/22.
//

import UIKit

final class ViewController: UIViewController {

    // 테이블뷰 생성
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
        setupDatas()
        setupNaviBar()
        setupTableViewConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    
    func setupNaviBar() {
        title = "회원 목록"
        
        // 네비게이션 설정 관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
        
    }
    
    // 테이블뷰 세팅
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    // 멤버 데이터 생성
    func setupDatas(){
        memberListManager.makeMembersListDatas()
    }
    
    // 테이블뷰 오토레이아웃 설정
    func setupTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    // 멤버를 추가하기 위해서 다음 화면으로 이동
    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    // 테이블뷰 사용시 아래 두 가지 함수를 반드시 작성해야함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
//        cell.mainImageView.image = memberListManager[indexPath.row].memberImage
//        cell.memberNameLabel.text = memberListManager[indexPath.row].name
//        cell.addressLabel.text = memberListManager[indexPath.row].address
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    // 선택적인 메서드
    // 셀이 눌렸을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음 화면으로 넘어가는 코드
        let detailVC = DetailViewController()
        
        // 다음 화면 대리자 설정
        detailVC.delegate = self
        
//        let array = memberListManager.getMembersList()
//        detailVC.member = array[indexPath.row]
        
        // 다음 화면에 멤버를 전달
        let currentMember = memberListManager.getMembersList()[indexPath.row]
        detailVC.member = currentMember
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        print("새 맴버 추가")
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        print("업데이트")
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
}
