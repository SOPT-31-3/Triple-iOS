//
//  PopularCollectionViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/24.
//

import UIKit
import SnapKit
import Then

class PopularCollectionViewCell: UICollectionViewCell {
    
    private let imageContainerView = UIView()
    
    private let popularImageCell = UIImageView().then{
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let background = UIView().then{
        $0.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.45)
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        cellShape()
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularCollectionViewCell{
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageContainerView)
        
        imageContainerView.addSubview(popularImageCell)
        imageContainerView.addSubview(background)
        imageContainerView.addSubview(titleLabel)
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        popularImageCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(12)
        }
    }
    
    func cellShape() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func dataBind(model: PopularImageModel) {
        popularImageCell.image = UIImage(named: model.popularImage)
        titleLabel.text = model.title
    }
}
