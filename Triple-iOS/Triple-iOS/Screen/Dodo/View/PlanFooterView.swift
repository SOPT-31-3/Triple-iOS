//
//  PlanFooterView.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/25.
//

import UIKit

class PlanFooterView: UIView {
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(Constant.Image.plus, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlanFooterView {
    private func layout(){
        self.addSubview(plusButton)
        
        plusButton.snp.makeConstraints { 
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(32)
            $0.width.equalTo(34)
            $0.height.equalTo(34)
        }
    }
}
