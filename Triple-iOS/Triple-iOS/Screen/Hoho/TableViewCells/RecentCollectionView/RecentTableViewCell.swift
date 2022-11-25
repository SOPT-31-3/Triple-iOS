//
//  RecentTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit

class RecentTableViewCell: UITableViewCell {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var recentCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        return view
      }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 본 상품"
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
    
    var dataList: [RecentImageModel] = [
        RecentImageModel(image: "recentImage1", info: "아야나 짐바란 리조트 앤스파,\n 발리", place: "짐바란", rating: "4.9 (93)", price: "282,267원"),
        RecentImageModel(image: "recentImage2", info: "코마네카 앳 라사 사양 - 스\n 서티피드", place: "우붓", rating: "4.7 (51)", price: "148,802원"),
        RecentImageModel(image: "recentImage3", info: "알릴라 스미냑, 발리 - 스 서\n티피드", place: "스미냑", rating: "4.8 (45)", price: "283,308원")
    ]
    
    // MARK: - Constants
    
    final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 50, left: 28.adjusted, bottom: 16, right: 28.adjusted)
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

extension RecentTableViewCell{
    
    private func register() {
        recentCollectionView.register(RecentCollectionViewCell.self,
                                forCellWithReuseIdentifier: RecentCollectionViewCell.className
        )
    }
    
    private func layout() {
        
        // MARK: - contentView
        [recentCollectionView, titleLabel, entireLabel].forEach{
            contentView.addSubview($0)
        }
        
        recentCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(29)
            $0.top.equalTo(11)
        }
        
        entireLabel.snp.makeConstraints{
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-21)
            $0.top.equalToSuperview().offset(15)
        }
    }
}

// MARK: -UICollectionDelegate

extension RecentTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 123.adjusted, height: 214.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imageListInset
    }
}

// MARK: -UICollectionViewDataSource

extension RecentTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let complexCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecentCollectionViewCell.className, for: indexPath)
                as? RecentCollectionViewCell else { return UICollectionViewCell() }
        complexCell.dataBind(model: dataList[indexPath.item])
        return complexCell
    }
}
