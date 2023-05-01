//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/12.
//

import Foundation
import Combine

final class DetailViewModel{
    
    let natwork: NetworkService
    let iteminfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(natwork: NetworkService, iteminfo: ItemInfo) {
        self.natwork = natwork
        self.iteminfo = iteminfo
    }
    
     func patch(){
         DispatchQueue.global().asyncAfter(deadline: .now() + 1.5){ [unowned self] in
             self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: iteminfo, details: ItemExtraInfo.mock)
             
         }
    
         
//         let resource: Resource<ItemInfoDetails> = Resource(base: <#T##String#>, path: <#T##String#>, params: [:], header: [:])
//
//         network.load(resource)
//             .receive(on: RunLoop.main)
//             .sink{}
//             .store(in: &Subscribers)
    }
    
}
