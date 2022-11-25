//
//  recentCustomView.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/24.
//

/// 여행사진, 장소 설명, 가격, 평점 등을 담아 놓은 커스텀 뷰
import UIKit
import SnapKit

class RecentCustomView: UIButton {

    private let imageContainerView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .clear
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
        label.textColor = .systemGray5
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
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecentCustomView{
    
    private func layout(){
        
        [imageContainerView, heartImageView, infoLabel, placeLabel, starImageView, ratingLabel, priceLabel].forEach{
            self.addSubview($0)
        }
        imageContainerView.addSubview(heartImageView)
    
        
        imageContainerView.snp.makeConstraints{
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(self.snp.trailing)
            $0.centerX.equalTo(self)
            $0.height.equalTo(123)
        }
        
        heartImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-6)
            $0.width.height.equalTo(34)
        }
        
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(imageContainerView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
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
    
    func dataSend(model: RecentImageModel) {
        
        imageContainerView.image = UIImage(named: model.image)
        imageContainerView.contentMode = .scaleAspectFit
        infoLabel.text = model.info
        placeLabel.text = model.place
        ratingLabel.text = model.rating
        priceLabel.text = model.price
    }
}
