//
//  TokyoCollectionViewController.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/19.
//

import UIKit

private let reuseIdentifier = "Cell"

class TokyoCollectionViewController: UICollectionViewController {
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //    layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 10.adjusted
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
        view.backgroundColor = .green
        view.clipsToBounds = true
        //view.register(TokoyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        
        self.view.addSubview(self.tokyoCollectionView)

          NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            self.collectionView.heightAnchor.constraint(equalToConstant: 500),
          ])

    }
}

extension TokyoCollectionViewController {
    private func register() {
        tokyoCollectionView.register(
            TokyoCollectionViewCell.self,
            forCellWithReuseIdentifier: TokyoCollectionViewCell.identifier
        )
    }
}
