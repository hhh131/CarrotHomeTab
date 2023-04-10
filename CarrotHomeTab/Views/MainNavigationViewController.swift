//
//  MainNavigationViewController.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/02.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImage(systemName: "arrow.backward")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationBar.tintColor = .white
    }
    



}
