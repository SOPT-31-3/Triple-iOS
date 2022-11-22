//
//  TokyoTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import SnapKit
import UIKit

class TokyoTableViewCell: UITableViewCell {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8.0.adjusted
        layout.itemSize = CGSize(width: 207.adjusted, height: 152.adjusted)
        return layout
    }()
    
    private lazy var tokyoCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
    //    view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    
    // MARK: - Variables
    
    var imageList: [TokyoImageModel] = [
        TokyoImageModel(tokyoImage: "tokyoImage1"),
        TokyoImageModel(tokyoImage: "tokyoImage2"),
    ]
    
    // MARK: - Constants
    
    final let imageListInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 28.adjusted, bottom: 0, right: 28.adjusted)
    final let imageListLineSpacing: CGFloat = 0
    final let cellHeight: CGFloat = 152.adjusted
    
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
    
    private func calculateCellHeight() -> CGFloat {
        return 152.adjusted
    }
    
    private func layout() {
        
        self.addSubview(tokyoCollectionView)
        
        tokyoCollectionView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(calculateCellHeight())
        }
    }
}

// MARK: -UICollectionDelegate

extension TokyoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 152.adjusted)
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
