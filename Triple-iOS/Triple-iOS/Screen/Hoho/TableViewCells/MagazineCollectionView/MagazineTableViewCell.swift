//
//  MagazineTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit
import SnapKit

class MagazineTableViewCell: UITableViewCell {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var magazineCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        return view
      }()
    
    private let magazineLabel: UILabel = {
        let label = UILabel()
        label.text = "여행 매거진"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let entireLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    var dataList: [MagazineImageModel] = [
        MagazineImageModel(magazineImage: "magazineImage1", title: "파리에서 놓칠 수 없는\n인생 사진 스팟⭐️"),
        MagazineImageModel(magazineImage: "magazineImage2", title: "요즘 유럽 가면\n'이곳'에 꼭 들린대요")
    ]
    
    // MARK: - Constants
    
    final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 51, left: 28.adjusted, bottom: 28, right: 28.adjusted)
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

extension MagazineTableViewCell{
    
    private func register() {
        magazineCollectionView.register(MagazineCollectionViewCell.self,
                                forCellWithReuseIdentifier: MagazineCollectionViewCell.className
        )
    }
    
    private func layout() {
        // MARK: - contentView
        [magazineCollectionView, magazineLabel, entireLabel].forEach{
            contentView.addSubview($0)
        }
        
        magazineCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        magazineLabel.snp.makeConstraints{
            $0.leading.equalTo(29)
            $0.top.equalTo(16)
        }
        
        entireLabel.snp.makeConstraints{
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            $0.top.equalTo(20)
        }
    }
}

// MARK: -UICollectionDelegate

extension MagazineTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 188.adjusted, height: 249.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imageListInset
    }
}

// MARK: -UICollectionViewDataSource

extension MagazineTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MagazineCollectionViewCell.className, for: indexPath)
                as? MagazineCollectionViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(model: dataList[indexPath.item])
        return imageCell
    }
}

