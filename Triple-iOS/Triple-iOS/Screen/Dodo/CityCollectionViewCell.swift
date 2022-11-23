//
//  CityCollectionViewCell.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/19.
//

import UIKit
import SnapKit
import Then

class CityCollectionViewCell: UICollectionViewCell {
    static let identifier = "CityCollectionViewCell"
    
    private let cityImageView = UIImageView()
    private let nameLabel = UILabel().then{
        $0.textColor = .white
        $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension CityCollectionViewCell {
    private func setLayout(){
        contentView.backgroundColor = .gray
        
        addSubview(cityImageView)
        cityImageView.addSubview(nameLabel)
        
        cityImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.width.equalTo(96)
        }
        nameLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func dataBind(model: CityModel) {
        nameLabel.text = model.cityName
        cityImageView.image = UIImage(named: model.cityImage)
        }
}
