//
//  IconCollectionViewcell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/25.
//

import UIKit
import SnapKit
import Then

class IconCollectionViewCell: UICollectionViewCell {
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconCollectionViewCell{
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [iconLabel, nameLabel].forEach{
            contentView.addSubview($0)
        }
        
        iconLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(iconLabel.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
        }
    }
        
    func dataBind(model: IconModel) {
        iconLabel.text = model.shape
        nameLabel.text = model.name
    }
}
