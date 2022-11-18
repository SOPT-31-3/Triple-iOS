//
//  CreateTravelViewController.swift
//  Triple-iOS
//
//  Created by 황찬미 on 2022/11/17.
//

import UIKit
import SnapKit

class CreateTravelViewController: UIViewController {
    
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
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 24.01)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        setLayout()
        configButton()
        
    }
}

extension CreateTravelViewController {
    @objc func touchupCloseButton(){
        let previousVC = HomeViewController()
        previousVC.modalPresentationStyle = .fullScreen
        self.present(previousVC, animated: true, completion: nil)
    }
    
    func configButton(){
        closeButton.setBackgroundImage(UIImage(named: "icX"), for: .normal)
    }
}

extension CreateTravelViewController {
    func setLayout(){
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
            $0.top.equalTo(self.closeButton.snp.bottom).offset(22)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(28)
        }
    }
}
