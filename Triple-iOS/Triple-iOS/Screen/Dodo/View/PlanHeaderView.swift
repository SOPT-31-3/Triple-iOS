//
//  PlanHeaderView.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/25.
//

import UIKit

import SnapKit
import Then

// MARK: - ListHeaderView
class PlanHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let dayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        // 1일차
    }
    
    private let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        // 02.04(토)
    }
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension
extension PlanHeaderView {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        self.addSubview(dayLabel)
        self.addSubview(dateLabel)
        
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(dayLabel)
            $0.leading.equalTo(dayLabel.snp.trailing).offset(8)
        }
        
    }
    
    func setDay(day: String) {
        dayLabel.text = day
    }
    
    func setDate(date: String){
        dateLabel.text = date
    }
}
