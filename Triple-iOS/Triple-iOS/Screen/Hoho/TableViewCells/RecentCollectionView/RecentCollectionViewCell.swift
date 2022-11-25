//
//  RecentCollectionViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/24.
//

import UIKit
import SnapKit
import Then

class RecentCollectionViewCell: UICollectionViewCell {
    
    private let imageContainerView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .clear
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            return view
    }()
    
    private let heartImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "heartImage")
        view.backgroundColor = .clear
        return view
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .systemGray2
        return label
    }()
    
    private let starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "starImage")
        view.backgroundColor = .clear
        return view
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        cellShape()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecentCollectionViewCell{
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [imageContainerView, heartImageView, infoLabel, placeLabel, starImageView, ratingLabel, priceLabel].forEach{
            contentView.addSubview($0)
        }
        
        imageContainerView.addSubview(heartImageView)
        
        imageContainerView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.centerX.equalTo(self)
            $0.width.height.equalTo(123)
        }
        
        heartImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-6)
            $0.width.equalTo(21)
            $0.height.equalTo(19)
        }
        
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(imageContainerView.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        placeLabel.snp.makeConstraints{
            $0.top.equalTo(infoLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        starImageView.snp.makeConstraints{
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints{
            $0.leading.equalTo(starImageView.snp.trailing).offset(4)
            $0.centerY.equalTo(starImageView)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(starImageView.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
    }
        
    func cellShape() {
            contentView.layer.cornerRadius = 10
            contentView.layer.masksToBounds = true
    }
        
    func dataBind(model: RecentImageModel) {
        imageContainerView.image = UIImage(named: model.image)
        imageContainerView.contentMode = .scaleAspectFill
        infoLabel.text = model.info
        placeLabel.text = model.place
        ratingLabel.text = model.rating
        priceLabel.text = model.price
    }
}
    

