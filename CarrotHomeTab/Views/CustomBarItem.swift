//
//  CustomBarItem.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/03.
//

import UIKit

struct CustomBarItemConfigration{
    
    typealias Handler = () -> Void
    
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}

final class CustomBarItem: UIButton{
    var customBarItemConfig: CustomBarItemConfigration
    
    init(config: CustomBarItemConfigration){
      self.customBarItemConfig = config
      super.init(frame: .zero)
        setupStyle()
        updateConfig()
        buttonTapped()
      
      self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
    
    private func setupStyle(){
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
        
    }
    
    private func updateConfig(){
        self.setTitle(customBarItemConfig.title, for: .normal)
        self.setImage(customBarItemConfig.image, for: .normal)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
