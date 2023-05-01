//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/02.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {
    //User
    @IBOutlet var userThumbnail: UIImageView!
    @IBOutlet var userNicName: UILabel!
    @IBOutlet var userLocation: UILabel!
    @IBOutlet var userTemperature: UILabel!
    
    //Item
    @IBOutlet var itemThumbnail: UIImageView!
    @IBOutlet var itemImfoTitle: UILabel!
    @IBOutlet var itemInfoDescription: UILabel!
    
    var viewModel: DetailViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.patch()
    }
    
    private func bind(){
        viewModel.$itemInfoDetails
            .compactMap{ $0 }
            .receive(on: RunLoop.main)
            .sink{ details in
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumnail))
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.userNicName.text = details.user.name
                self.userLocation.text = details.user.location
                self.userTemperature.text = "\(details.user.temperature)°C"
                self.itemImfoTitle.text = details.item.title
                self.itemInfoDescription.text = details.details.descriptions
                
            }.store(in: &subscriptions)
    }
}
