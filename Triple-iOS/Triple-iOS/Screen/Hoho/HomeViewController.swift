//
//  HomeViewController.swift
//  Triple-iOS
//
//  Created by 황찬미 on 2022/11/17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }()
    
    private let tableHeaderView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TRIPLE"
        label.font = .systemFont(ofSize: 17.57.adjusted, weight: .bold)
        return label
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icSearch")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let noticeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icNotice")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var baseTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let introLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "다시열린 해외여행,\n도쿄에서 워밍업!"
        label.font = .systemFont(ofSize: 24.01.adjusted, weight: .bold)
        return label
    }()


    override func viewDidLoad() {
        layout()
        register()
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}


extension HomeViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .clear
        
        // MARK: - superView
        [headerView, tableHeaderView, baseTableView].forEach{
            view.addSubview($0)
        }
        
        // MARK: - headerView
        [titleLabel, searchImage, noticeImage].forEach{
            headerView.addSubview($0)
        }
        
        // MARK: - tableView
        tableHeaderView.addSubview(introLabel)
        
        //scrollView.addSubview(tokyoCollectionView)
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55.adjusted)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(45.adjusted)
        }
        
        baseTableView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-18.adjusted)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30.adjusted)
            $0.centerY.equalToSuperview()
        }
        
        searchImage.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-47.adjusted)
            $0.height.width.equalTo(34.adjusted)
            $0.centerY.equalToSuperview()
        }
        
        noticeImage.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-13.adjusted)
            $0.height.width.equalTo(34.adjusted)
            $0.centerY.equalToSuperview()
        }
        
        introLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(35.adjusted)
            $0.leading.equalToSuperview().offset(28.adjusted)
        }
        
        // tableView에 헤더 추가
        tableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        baseTableView.tableHeaderView = tableHeaderView
        tableHeaderView.snp.makeConstraints{
            $0.width.equalTo(self.view.bounds.width)
            $0.height.equalTo(110.adjusted)
        }
        tableHeaderView.layoutIfNeeded()
    }

    
    private func register() {
        
        baseTableView.register(TokyoTableViewCell.self,
                                forCellReuseIdentifier: TokyoTableViewCell.className
        )
        baseTableView.register(IconTableViewCell.self,
                                forCellReuseIdentifier: IconTableViewCell.className
        )
        baseTableView.register(PopularTableViewCell.self,
                                forCellReuseIdentifier: PopularTableViewCell.className
        )
        baseTableView.register(RecentTableViewCell.self,
                                forCellReuseIdentifier: RecentTableViewCell.className
        )
        baseTableView.register(MagazineTableViewCell.self,
                                forCellReuseIdentifier: MagazineTableViewCell.className
        )
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 192
        case 1:
            return 192
        case 2:
            return 171
        case 3:
            return 280
        case 4:
            return 328
        default:
            return 0
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5 // collection view를 5개 생성할 것
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 각 collection view는 가로로 scroll 되고, 하나의 row만을 가진다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TokyoTableViewCell.className, for: indexPath)
                    as? TokyoTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none // 셀을 눌렀을 때 회색으로 변하지 않게 하기
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: IconTableViewCell.className, for: indexPath)
                    as? IconTableViewCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PopularTableViewCell.className, for: indexPath)
                    as? PopularTableViewCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecentTableViewCell.className, for: indexPath)
                    as? RecentTableViewCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MagazineTableViewCell.className, for: indexPath)
                    as? MagazineTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
        //eachCell.dataBind(model: profileList[indexPath.row])
    }
}

