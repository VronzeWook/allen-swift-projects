//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by 이동욱 on 2023/11/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var member:Member? {
        // member가 변하면 didSet 실행
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        self.addSubview(mainImageView)
        
        // 셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    // 지정생성자를 재정의할 때, 반드시 필수 생성자 또한 정의해주어야 한다.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    // 스토리보드로 앱을 만들 때 뷰디드로드 역할을 하는 함수
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

    //MARK: - 오토레이아웃 셋팅
    // 오토레이아웃을 정하는 시점
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
            
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
}
