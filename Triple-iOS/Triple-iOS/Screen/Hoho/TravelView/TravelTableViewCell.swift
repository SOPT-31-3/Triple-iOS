//
//  TravelTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/12/01.
//

import UIKit

import SnapKit
import Then

// MARK: - ListTableViewCell
class TravelTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - UI Components
    
    private let cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "", size: 12)
        return label
    }()
    
    
    private let circleImgView = UIImageView()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "", size: 12)
        return label
    }()
    
    // MARK: - View Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        config()
        configImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension
extension TravelTableViewCell {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        contentView.addSubview(cellView)
        [contentLabel, timeLabel, circleImgView].forEach{
            cellView.addSubview($0)
        }
        
        cellView.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(33)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.leading.equalToSuperview()
        }
        
        circleImgView.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(14)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(timeLabel.snp.trailing).offset(33)
            $0.top.bottom.equalTo(timeLabel)
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


