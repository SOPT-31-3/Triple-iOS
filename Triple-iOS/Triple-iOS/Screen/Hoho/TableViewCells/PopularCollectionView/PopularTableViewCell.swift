//
//  PopularTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit
import SnapKit


class PopularTableViewCell: UITableViewCell {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var popularCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        return view
      }()
    
    private let realTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 여행지"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let entireLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    // MARK: - Variables
    
    var imageList: [PopularImageModel] = [
        PopularImageModel(popularImage: "popularImage1", title: "바르셀로나"),
        PopularImageModel(popularImage: "popularImage2", title: "그라나다"),
    ]
    
    // MARK: - Constants
    
    final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 55, left: 28.adjusted, bottom: 19, right: 28.adjusted)
    final let imageListLineSpacing: CGFloat = 10.adjusted
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularTableViewCell{
    
    private func register() {
        popularCollectionView.register(PopularCollectionViewCell.self,
                                forCellWithReuseIdentifier: PopularCollectionViewCell.className
        )
    }
    
    private func layout() {
        
        // MARK: - contentView
        [popularCollectionView, realTimeLabel, entireLabel].forEach{
            contentView.addSubview($0)
        }
        
        popularCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        realTimeLabel.snp.makeConstraints{
            $0.leading.equalTo(29)
            $0.top.equalTo(21)
        }
        
        entireLabel.snp.makeConstraints{
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-21)
            $0.top.equalTo(28)
        }
        
    }
}

// MARK: -UICollectionDelegate

extension PopularTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175.adjusted, height: 97.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imageListInset
    }
}

// MARK: -UICollectionViewDataSource

extension PopularTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PopularCollectionViewCell.className, for: indexPath)
                as? PopularCollectionViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(model: imageList[indexPath.item])
        return imageCell
    }
}
