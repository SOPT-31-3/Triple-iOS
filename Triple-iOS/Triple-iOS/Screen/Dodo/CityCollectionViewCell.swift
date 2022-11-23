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
        
        [cityImageView, nameLabel].forEach {
            contentView.addSubview($0)
        }
        
        cityImageView.snp.makeConstraints {
            $0.top.leading.trailing.height.equalToSuperview()
//            $0.width.equalTo(96)
//            $0.height.equalTo(96)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.cityImageView.snp.top).offset(36)
            $0.leading.equalTo(self.cityImageView.snp.leading).offset(38)
        }
    }
    
    func dataBind(model: CityModel) {
        nameLabel.text = model.cityName
        cityImageView.image = UIImage(named: model.cityImage)
        }
}
