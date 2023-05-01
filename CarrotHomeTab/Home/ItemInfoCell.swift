//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/10.
//

import UIKit
import Kingfisher

class ItemInfoCell: UICollectionViewCell {
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var numOfChatLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var numOfLikeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
        thumbnail.layer.masksToBounds = true
        thumbnail.tintColor = .systemGray
    }
    
    
    func configure(item: ItemInfo) {
        titleLabel.text = item.title
        descriptionLabel.text = item.location
        priceLabel.text = "\(formatNumber(item.price))원"
        numOfChatLabel.text = "\(item.numOfChats)"
        numOfLikeLabel.text = "\(item.numOfLikes)"
        
        thumbnail.kf.setImage(
            with: URL(string: item.thumbnailURL)!,
            placeholder: UIImage(systemName: "hands.sparkles.fill")
        )
    }
    
    private func formatNumber(_ price: Int) -> String{
        let formatter = NumberFormatter()
//        formatter.locale = Locale(identifier: "ko-KR")
        formatter.numberStyle = .decimal
        
        let result = formatter.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
