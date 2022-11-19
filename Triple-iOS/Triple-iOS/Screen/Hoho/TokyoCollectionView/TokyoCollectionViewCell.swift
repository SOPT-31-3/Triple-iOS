//
//  TokyoCollectionViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/19.
//

import UIKit

class TokyoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TokyoCollectionViewCell"
    
    private let imageContainerView = UIView()
    private let tokyoImageCell = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TokyoCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageContainerView)
        
        imageContainerView.addSubview(tokyoImageCell)
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tokyoImageCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: TokyoImageModel) {
        tokyoImageCell.image = UIImage(named: model.tokyoImage)
    }
}

