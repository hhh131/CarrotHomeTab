//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/02.
//

import UIKit
//탭이 눌릴때마다 그에 맞는 네비게이션 바를 구성
// -탭이 눌리는 것을 감지 헤야겠다.
// - 감지후에 그 탭에 맞게 네비게이션 바 구성을 업데이트

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        
    }
}

extension MainTabBarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
  
        switch viewController {
        case is HomeViewcontrollerViewController:
            let titleConfig = CustomBarItemConfigration(
                title: "정자동",
                image: nil,
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let searchConfig = CustomBarItemConfigration(
                image: UIImage(systemName:"magnifyingglass"),
                handler: { print("--> saerchTapped")})
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
      
            let feedConfig = CustomBarItemConfigration(
                image: UIImage(systemName:"bell"),
                handler: { print("--> feedTapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
  
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem,searchItem]
            
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfigration(
                title: "정자동",
                image: nil,
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
        
            let feedConfig = CustomBarItemConfigration(
                image: UIImage(systemName:"bell"),
                handler: { print("--> feedTapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
  
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
            
        case is ChatViewController:
            let titleConfig = CustomBarItemConfigration(
                title: "채팅",
                handler: { }
            )
            let feedConfig = CustomBarItemConfigration(
                image: UIImage(systemName:"bell"),
                handler: { print("--> feedTapped")}
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
  
            
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfigration(
                title: "나의 당근",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let settingConfig = CustomBarItemConfigration(
                image: UIImage(systemName:"gearshape"),
                handler: { print("--> setting tapped")}
            )
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
      
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
            
        default:
            let titleConfig = CustomBarItemConfigration(
                title: "정자동",
                image: nil,
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
        
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            
        }
        
    }
}
