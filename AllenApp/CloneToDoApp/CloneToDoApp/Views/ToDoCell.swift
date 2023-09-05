//
//  ToDoCell.swift
//  CloneToDoApp
//
//  Created by 이동욱 on 2024/01/12.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    // (테이블뷰셀에는 원래 backgroundView속성이 존재하기 때문에 이름 충돌발생함)
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    // ToDoData를 전달받을 변수
    var toDoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    
    // 실행하고 싶은 클로저 저장
    // 뷰컨트롤러에 있는 클로저 저장할 예정 {셀(자신)을 전달}
    var updateButtonPressed: (ToDoCell) -> Void = {(sender) in}
    
    // 스토리보드 생성자

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configureUI
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
