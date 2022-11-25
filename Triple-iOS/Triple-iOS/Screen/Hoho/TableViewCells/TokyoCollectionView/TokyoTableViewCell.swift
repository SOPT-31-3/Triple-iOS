//
//  TokyoTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit
import SnapKit


class TokyoTableViewCell: UITableViewCell {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var tokyoCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        return view
      }()
    
    // MARK: - Variables
    
    var imageList: [TokyoImageModel] = [
        TokyoImageModel(tokyoImage: "tokyoImage1", title: "도쿄 디즈니랜드", region: "일본·도쿄"),
        TokyoImageModel(tokyoImage: "tokyoImage2", title: "도쿄 잇시키 해안", region: "일본·도쿄"),
    ]
    
    // MARK: - Constants
    
    final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 28.adjusted, bottom: 20, right: 28.adjusted)
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

extension TokyoTableViewCell{
    
    private func register() {
        tokyoCollectionView.register(TokyoCollectionViewCell.self,
                                forCellWithReuseIdentifier: TokyoCollectionViewCell.className
        )
    }
    
    private func layout() {
        
        contentView.addSubview(tokyoCollectionView)
        
        tokyoCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: -UICollectionDelegate

extension TokyoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 207.adjusted, height: 152.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imageListInset
    }
}

// MARK: -UICollectionViewDataSource

extension TokyoTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TokyoCollectionViewCell.className, for: indexPath)
                as? TokyoCollectionViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(model: imageList[indexPath.item])
        return imageCell
    }
}
