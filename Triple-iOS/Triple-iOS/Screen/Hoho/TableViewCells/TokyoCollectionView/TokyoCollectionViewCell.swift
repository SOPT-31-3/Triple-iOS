//
//  TokyoCollectionViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/22.
//

import UIKit
import SnapKit
import Then

class TokyoCollectionViewCell: UICollectionViewCell {
    
    private let imageContainerView = UIView()
    
    private let tokyoImageCell = UIImageView().then{
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
    
    private let regionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let markImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "markImage")
        view.backgroundColor = .clear
        return view
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

extension TokyoCollectionViewCell{
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageContainerView)
        [tokyoImageCell, background, titleLabel, regionLabel, markImageView].forEach{
            imageContainerView.addSubview($0)
        }
        
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tokyoImageCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(16)
        }
        
        regionLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-19)
            $0.trailing.equalToSuperview().offset(-31)
        }
        
        markImageView.snp.makeConstraints{
            $0.leading.equalTo(regionLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(regionLabel)
            $0.width.equalTo(10)
            $0.height.equalTo(13)
        }
        
    }
    
    func cellShape() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func dataBind(model: TokyoImageModel) {
        tokyoImageCell.image = UIImage(named: model.tokyoImage)
        titleLabel.text = model.title
        regionLabel.text = model.region
    }
}
