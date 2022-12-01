//
//  MyProfileViewController.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/21.
//

import UIKit
import SnapKit

class MyTravelViewController: UIViewController {
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.green
        return headerView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "icBack"), for: .normal)
        return button
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "icEdit"), for: .normal)
        return button
    }()
    
    // MARK: - profile image sets
    
    private let firstProfileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "city2")
        view.backgroundColor = .clear
        return view
    }()
    
    private let secondProfileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "city5")
        view.backgroundColor = .clear
        return view
    }()
    
    private let thirdProfileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "city11")
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - city name sets
    
    private let firstCityLabel: UILabel = {
        let label = UILabel()
        label.text = "파리"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let secondCityLabel: UILabel = {
        let label = UILabel()
        label.text = "리옹"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let thirdCityLabel: UILabel = {
        let label = UILabel()
        label.text = "니스"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    // MARK: - travel date sets
    
    private let firstTravelLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.02.04 (토)  -  2023. 02.06 (화)"
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let secondTravelLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.02.07 (수)  -  2023. 02.09 (금)"
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private let thirdTravelLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.02.10 (토)  -  2023. 02.12 (월)"
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    // MARK: - horizontalLine
    private let horizontalLineView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let horizontalLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let horizontalLineView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    // MARK: - Variables
    
    var travelList1: [MyTravelModel] = [
        MyTravelModel(time: "11:00", content: "샤르드골 공항 도착/OZ088"),
        MyTravelModel(time: "15:00", content: "호텔 체크인"),
        MyTravelModel(time: "19:00", content: "니커버커 식당 예약"),
        MyTravelModel(time: "19:00", content: "몽생미셸 투어 시작"),
    ]
    
    var travelList2: [MyTravelModel] = [
        MyTravelModel(time: "11:00", content: "호텔 체크아웃"),
        MyTravelModel(time: "15:00", content: "휴식"),
    ]
    
    var travelList3: [MyTravelModel] = [
        MyTravelModel(time: "11:00", content: "타워브릿지 투어시작"),
        MyTravelModel(time: "15:00", content: "휴식"),
    ]
    
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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        layout()
        register()
    }
}

extension MyTravelViewController{
    
    private func layout() {
        view.backgroundColor = .clear
        
        [backButton, editButton].forEach{
            headerView.addSubview($0)
        }
        
        [headerView,listTableView,
         firstProfileImageView, firstCityLabel, firstTravelLabel,
         secondProfileImageView, secondCityLabel, secondTravelLabel,
         thirdProfileImageView, thirdCityLabel, thirdTravelLabel,
         horizontalLineView1, horizontalLineView2, horizontalLineView3].forEach{
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(100.adjusted)
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(52.79.adjusted)
            $0.leading.equalToSuperview().offset(22.68.adjusted)
            $0.width.height.equalTo(33.adjusted)
        }
        
        editButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(52.79.adjusted)
            $0.trailing.equalToSuperview().offset(-16.79.adjusted)
            $0.width.height.equalTo(33.adjusted)
        }
        
        firstProfileImageView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(22)
            $0.width.height.equalTo(54)
        }
        
        firstCityLabel.snp.makeConstraints{
            $0.leading.equalTo(firstProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(headerView.snp.bottom).offset(26)
        }
        
        firstTravelLabel.snp.makeConstraints{
            $0.leading.equalTo(firstProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(firstCityLabel.snp.bottom).offset(3)
        }
        
        horizontalLineView1.snp.makeConstraints{
            $0.top.equalTo(firstTravelLabel.snp.bottom).offset(381.adjusted)
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(1.5)
            $0.centerX.equalToSuperview()
        }
        
        secondProfileImageView.snp.makeConstraints{
            $0.top.equalTo(horizontalLineView1.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(22)
            $0.width.height.equalTo(54)
        }
        
        secondCityLabel.snp.makeConstraints{
            $0.leading.equalTo(secondProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(horizontalLineView1.snp.bottom).offset(26)
        }
        
        secondTravelLabel.snp.makeConstraints{
            $0.leading.equalTo(secondProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(secondCityLabel.snp.bottom).offset(3)
        }
        
        horizontalLineView2.snp.makeConstraints{
            $0.top.equalTo(horizontalLineView1.snp.bottom).offset(84.adjusted)
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(1.5)
            $0.centerX.equalToSuperview()
        }
        
        thirdProfileImageView.snp.makeConstraints{
            $0.top.equalTo(horizontalLineView2.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(22)
            $0.width.height.equalTo(54)
        }
        
        thirdCityLabel.snp.makeConstraints{
            $0.leading.equalTo(thirdProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(horizontalLineView2.snp.bottom).offset(26)
        }
        
        thirdTravelLabel.snp.makeConstraints{
            $0.leading.equalTo(thirdProfileImageView.snp.trailing).offset(18.adjusted)
            $0.top.equalTo(thirdCityLabel.snp.bottom).offset(3)
        }
        
        horizontalLineView3.snp.makeConstraints{
            $0.top.equalTo(horizontalLineView2.snp.bottom).offset(84.adjusted)
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(1.5)
            $0.centerX.equalToSuperview()
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(firstTravelLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(horizontalLineView1.snp.top)
        }
    }
    private func register() {
        
        listTableView.register(TravelTableViewCell.self,
                               forCellReuseIdentifier: TravelTableViewCell.className
        )
    }
}

// MARK: - UITableViewDataSource
extension MyTravelViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        // 전체 섹션이 몇개인지
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 0
        }
        // 한 섹션당 셀이 몇개인지
    }
    
    // 각각의 table cell에 dataBind 해주기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.className, for: indexPath) as? TravelTableViewCell else {return UITableViewCell()}
        switch indexPath.section{
        case 0:
            cell.dataBind(model: travelList1[indexPath.item])
            return cell
        case 1:
            cell.dataBind(model: travelList2[indexPath.item])
            return cell
        case 2:
            cell.dataBind(model: travelList2[indexPath.item])
            return cell
        default:
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension MyTravelViewController: UITableViewDelegate {
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
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        // 헤더섹션 높이
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
        // 푸터섹션 높이
    }
}
