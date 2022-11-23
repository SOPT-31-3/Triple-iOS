//
//  TabBarController.swift
//  Triple-iOS
//
//  Created by 황찬미 on 2022/11/17.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}

extension TabBarController {
    
    private func setTabBar() {
        view.backgroundColor = .white
        
        let homeTap = UINavigationController(rootViewController: HomeViewController())
        homeTap.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "homeSelected")?.withRenderingMode(.alwaysOriginal))
        
        let wishTap = UINavigationController(rootViewController: WishViewController())
        wishTap.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "wish")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "wishSelected")?.withRenderingMode(.alwaysOriginal))
        
        let createTravelTap = UINavigationController(rootViewController: CityGridViewController())
        createTravelTap.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "createTravel")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "createTravel")?.withRenderingMode(.alwaysOriginal))
        
        let myTravelTap = UINavigationController(rootViewController: MyTravelViewController())
        myTravelTap.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "myTravel")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "myTravelSelected")?.withRenderingMode(.alwaysOriginal))
        
        let myProfileTravelTap = UINavigationController(rootViewController: MyProfileViewController())
        myProfileTravelTap.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "myProfile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "myProfileSelected")?.withRenderingMode(.alwaysOriginal))

        
        let tabs = [homeTap, wishTap, createTravelTap, myTravelTap, myProfileTravelTap]
    
        self.setViewControllers(tabs, animated: false)
    }
}
