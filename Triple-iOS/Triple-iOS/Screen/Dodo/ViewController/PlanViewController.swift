//
//  PlanViewController.swift
//  Triple-iOS
//
//  Created by 고두영 on 2022/11/25.
//

import UIKit

import SnapKit
import Then
import Moya

//func addPlanList(plan: PlanList, index: IndexPath) {
//    let pleaseList = plan
//    let pleaseIndex = index
//}
// indexPath?

protocol PlanListDelegate {
    func addPlanList(plan: PlanList)
}

// MARK: - PlanViewController
class PlanViewController: UIViewController {
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
    
    let friendButton:UIButton = {
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
    
    lazy var saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("전체 저장", for: .normal)
        button.setTitleColor(UIColor.white , for: .normal)
        button.addTarget(self, action: #selector(touchupSaveButton), for: .touchUpInside)
        button.backgroundColor = .green
        return button
    }()
    
    // MARK: - UI Components
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    let userProvider = MoyaProvider<Router>(
            plugins: [NetworkLoggerPlugin(verbose: true)]
            )
    
    func presentToHome() {
        let nextVC = TabBarController()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
    }
    
    var resultArray: [PlanList] = []
    var responseData: SaveResponsetDto?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
        config()
        configButton()
        configImageView()
        navibarHideen()
    }
}

// MARK: - Extension
extension PlanViewController: PlanListDelegate {
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        [headerView, closeButton, headerLabel1, friendButton, menuImgView, saveButton, listTableView].forEach {
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
        }
        
        friendButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-18)
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
        
        saveButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(63)
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(menuImgView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(saveButton.snp.top)
        }
    }
    
    // MARK: - General Helper
    private func config() {
        view.backgroundColor = .white
    }
    
    private func register() {
        listTableView.register(PlanTableViewCell.self, forCellReuseIdentifier: PlanTableViewCell.identifier)
    }
    
    private func navibarHideen() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc
    private func touchupCloseButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc
    private func touchupSaveButton(){
        save(param: resultArray)
    }
    
    func addPlanList(plan: PlanList) {
        if (plan.content != ""){
            resultArray.append(plan)
        }
        print(resultArray)
    }
    
    private func save(param: [PlanList]) {
        userProvider.request(.save(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    self.responseData = try result.map(SaveResponsetDto.self)
                    self.responseData?.data?.id
                }
                catch(let error) {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                print("실패")
            }
            }
        }
    
    private func configButton(){
        closeButton.setBackgroundImage(Constant.Image.icX, for: .normal)
        friendButton.setBackgroundImage(Constant.Image.friend, for: .normal)
    }
    
    private func configImageView(){
        menuImgView.image = UIImage(named: "menu")
    }
}


// MARK: - UITableViewDataSource
extension PlanViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        // 전체 섹션이 몇개인지
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        // 한 섹션당 셀이 몇개인지
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlanTableViewCell.identifier, for: indexPath) as? PlanTableViewCell else {return UITableViewCell()}
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PlanViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = PlanHeaderView()
        view.setDay(day: sampleDay[section])
        view.setDate(date: sampleDate[section])
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = PlanFooterView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        // 헤더섹션 높이
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45
        // 푸터섹션 높이
    }
}
