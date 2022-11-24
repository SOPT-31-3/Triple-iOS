//
//  MakePlanViewController.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/24.
//

import UIKit

class MakePlanViewController: UIViewController {
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
    
    lazy var friendButton:UIButton = {
        let button = UIButton()
        return button
    }()
    
    let headerLabel1:UILabel = {
        let label = UILabel()
        label.text = "파리에서의\n여행 일정을 완성하세요."
        label.font = .systemFont(ofSize: 24.01, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let menuImgView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        configButton()
        configImageView()
    }
}

extension MakePlanViewController {
    private func setLayout(){
        view.backgroundColor = .white
        
        [headerView, closeButton, headerLabel1, friendButton, menuImgView].forEach {
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
        
        friendButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-18)
            $0.width.equalTo(72)
            $0.height.equalTo(36)
        }
        
        headerLabel1.snp.makeConstraints {
            $0.bottom.equalTo(self.headerView.snp.bottom).offset(-20)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(28)
        }
        
        menuImgView.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(375)
            $0.height.equalTo(43)
        }
        
    }
}

extension MakePlanViewController {
    @objc
    private func touchupCloseButton(){
        let previousVC = HomeViewController()
        previousVC.modalPresentationStyle = .fullScreen
        self.present(previousVC, animated: true, completion: nil)
    }
    
    private func configButton(){
        closeButton.setBackgroundImage(Constant.Image.icX, for: .normal)
        friendButton.setBackgroundImage(Constant.Image.friend, for: .normal)
    }
    
    private func configImageView(){
        menuImgView.image = UIImage(named: "menu")
    }
}
