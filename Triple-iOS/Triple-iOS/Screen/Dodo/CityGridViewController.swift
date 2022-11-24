//
//  CityGridViewController.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/19.
//

import UIKit
import SnapKit

class CityGridViewController: UIViewController {
    let headerView:UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var closeButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupCloseButton), for: .touchUpInside)
        return button
    }()
    
    let headerLabel1:UILabel = {
        let label = UILabel()
        label.text = "떠나고 싶은\n도시를 선택하세요."
        label.font = .systemFont(ofSize: 24.01, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var cityCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        }()
    
    var CityList: [CityModel] = [
        CityModel(cityImage: "city1", cityName: "뉴욕"),
        CityModel(cityImage: "city2", cityName: "파리"),
        CityModel(cityImage: "city3", cityName: "방콕"),
        CityModel(cityImage: "city4", cityName: "디종"),
        CityModel(cityImage: "city5", cityName: "발리"),
        CityModel(cityImage: "city6", cityName: "로마"),
        CityModel(cityImage: "city7", cityName: "체코"),
        CityModel(cityImage: "city8", cityName: "런던"),
        CityModel(cityImage: "city9", cityName: "리옹"),
        CityModel(cityImage: "city10", cityName: "뮌헨"),
        CityModel(cityImage: "city11", cityName: "도쿄"),
        CityModel(cityImage: "citySearch", cityName: ""),
    ]
    
    final let kCityInset: UIEdgeInsets = UIEdgeInsets(top: 22, left: 20, bottom: 0, right: 19)
    final let kCityLineSpacing: CGFloat = 16
    final let kCityInterItemSpacing: CGFloat = 24
    final let kCellHeight: CGFloat = 96

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        setLayout()
        register()
        configButton()
    }

}

extension CityGridViewController {
    @objc
    private func touchupCloseButton(){
        let previousVC = HomeViewController()
        previousVC.modalPresentationStyle = .fullScreen
        self.present(previousVC, animated: true, completion: nil)
    }
    
    private func configButton(){
        closeButton.setBackgroundImage(Constant.Image.icX, for: .normal)
    }
}

extension CityGridViewController {
    private func setLayout(){
        view.backgroundColor = .white
        
        [headerView, closeButton, headerLabel1].forEach {
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(199)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(53)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            $0.width.height.equalTo(24)
        }
        
        headerLabel1.snp.makeConstraints {
            $0.bottom.equalTo(self.headerView.snp.bottom).offset(-20)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(28)
        }
        
        view.addSubview(cityCollectionView)
        cityCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func register(){
        cityCollectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(CityList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kCellHeight + (heightCount - 1) * kCityLineSpacing + kCityInset.top + kCityInset.bottom
    }
}

extension CityGridViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cityCell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath)
                    as? CityCollectionViewCell else { return UICollectionViewCell() }
        cityCell.dataBind(model: CityList[indexPath.item])
        return cityCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 1 {
            let planVC = MakePlanViewController()
            planVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(planVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellForItemRow: CGFloat = 3
        let minimumSpacing: CGFloat = 24
        let width = (screenWidth - 39 - minimumSpacing * 2) / cellForItemRow
        return CGSize(width: width, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kCityLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kCityInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kCityInset
    }
}
