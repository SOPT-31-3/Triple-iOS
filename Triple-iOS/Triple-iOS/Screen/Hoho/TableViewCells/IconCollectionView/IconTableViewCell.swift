//
//  IconTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class IconTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
        
        private lazy var iconCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            //collectionView.isScrollEnabled = true
            collectionView.showsVerticalScrollIndicator = false
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        
        // MARK: - Variables
        
        var iconList: [IconModel] = [
            IconModel(shape: "✈️", name: "항공권"),
            IconModel(shape: "🏢", name: "숙소"),
            IconModel(shape: "🎟️", name: "투어 티켓"),
            IconModel(shape: "🧳", name: "해외 패키지"),
            IconModel(shape: "📗", name: "책"),
            IconModel(shape: "🏯", name: "오사카 여행"),
            IconModel(shape: "⛩️", name: "일본 특가"),
            IconModel(shape: "🚘", name: "혜택 렌터카"),
            IconModel(shape: "🛩️", name: "특가 항공권"),
            IconModel(shape: "🍊", name: "제주 여행")
        ]
    
    // MARK: - Constants
        
        final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 22, bottom: 20, right: 22)
        final let imageLineSpacing: CGFloat = 4
        final let interItemSpacing: CGFloat = 8
        final let kCellHeight: CGFloat = 74
    
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IconTableViewCell{
    
    private func register() {
        iconCollectionView.register(IconCollectionViewCell.self,
                                forCellWithReuseIdentifier: IconCollectionViewCell.className
        )
    }
    
    private func layout() {
        iconCollectionView.backgroundColor = .white
        contentView.addSubview(iconCollectionView)
        
        iconCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(192)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension IconTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let fiveCellWidth = screenWidth - imageListInset.left - imageListInset.right - interItemSpacing * 4
        return CGSize(width: fiveCellWidth / 5, height: 74)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imageListInset
    }
}

extension IconTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let iconCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: IconCollectionViewCell.className, for: indexPath)
                as? IconCollectionViewCell else { return UICollectionViewCell() }
        iconCell.dataBind(model: iconList[indexPath.item])
        return iconCell
    }
}
