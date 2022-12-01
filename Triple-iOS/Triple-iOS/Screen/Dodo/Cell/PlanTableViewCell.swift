//
//  ListTableViewCell.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/25.
//

import UIKit

import SnapKit
import Then
import Moya

// MARK: - ListTableViewCell
class PlanTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - Identifier
    
    static let identifier = "PlanTableViewCell"
    
    // MARK: - UI Components
    
    private let cellView:UIView = {
        let view = UIView()
        return view
    }()
    
    public let timeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "00:00"
        textField.font = UIFont(name: "", size: 12)
        return textField
    }()
    
    private let circleImgView = UIImageView()
    
    private let contentTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "내용을 입력하세요."
        textField.font = UIFont(name: "", size: 12)
        return textField
    }()
    
    var array: [PlanList] = []
    
    func checkInput() {
        if let time = popInput(),
           let content = popInput2() {
            
            array.append(PlanList(dayID: 1, time: time, content: content))
//            let param = SaveRequestDto(planList: [PlanList(dayID: 1, time: time, content: content)])
            print("테스트: \(array)")
            print(content)
            save(param: array)
        }
    }
    
    let userProvider = MoyaProvider<Router>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    // MARK: - View Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        config()
        configImageView()
        timeTextField.delegate = self
        contentTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension
extension PlanTableViewCell {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        contentView.addSubview(cellView)
        [contentTextField, timeTextField, circleImgView].forEach{
            cellView.addSubview($0)
        }
        
        cellView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(33)
        }
        
        timeTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.equalToSuperview()
        }
        
        circleImgView.snp.makeConstraints {
            $0.centerY.equalTo(timeTextField)
            $0.leading.equalTo(timeTextField.snp.trailing).offset(14)
        }
        
        contentTextField.snp.makeConstraints {
            $0.leading.equalTo(timeTextField.snp.trailing).offset(33)
            $0.top.bottom.equalTo(timeTextField)
        }
    }
    
    func popInput() -> String? {
        return timeTextField.text
    }
    
    func popInput2() -> String? {
        return contentTextField.text
    }
    
    private func save(param: [PlanList]) {
        userProvider.request(.save(param: array)) { response in
            switch response {
            case .success(let result):
                print("성공")
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    let call = PlanViewController()
                    call.presentToHome()
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("실패")
            }
        }
    }
    
    
    private func configImageView(){
        circleImgView.image = UIImage(named: "circle")
    }
    
    private func config() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
}
