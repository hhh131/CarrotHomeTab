//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/03.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    static func generate(with config: CustomBarItemConfigration, width: CGFloat? = nil) -> UIBarButtonItem {
        
        let customView = CustomBarItem(config: config)
        if let width = width{
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
        
    }
}
