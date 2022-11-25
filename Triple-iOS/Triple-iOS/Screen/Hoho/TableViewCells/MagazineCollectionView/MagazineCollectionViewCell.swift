//
//  MagazineCollectionViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/25.
//

import UIKit
import SnapKit
import Then

class MagazineCollectionViewCell: UICollectionViewCell {
    
    private let imageContainerView = UIView()
    
    private let magazineImageCell = UIImageView().then{
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
        label.numberOfLines = 2
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

extension MagazineCollectionViewCell{
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageContainerView)
        
        imageContainerView.addSubview(magazineImageCell)
        imageContainerView.addSubview(background)
        imageContainerView.addSubview(titleLabel)
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        magazineImageCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(18)
        }
    }
    
    func cellShape() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func dataBind(model: MagazineImageModel) {
        magazineImageCell.image = UIImage(named: model.magazineImage)
        titleLabel.text = model.title
    }
}
