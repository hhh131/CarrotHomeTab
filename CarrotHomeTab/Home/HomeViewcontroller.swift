//
//  HomeViewcontrollerViewController.swift
//  CarrotHomeTab
//
//  Created by 신희권 on 2023/04/02.
//

import UIKit
import Combine

class HomeViewcontroller: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    typealias Item = ItemInfo
    enum Section {
        case main
    }
    var dataSource: UICollectionViewDiffableDataSource<Section,Item>!
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration:
            .default))
    var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        bind()
        viewModel.fetch()
        
        collectionView.delegate = self
       }
    private func configureCollectionView(){
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemInfoCell", for: indexPath) as? ItemInfoCell else { return nil }
            cell.configure(item: item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
         var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([],toSection: .main)
        dataSource.apply(snapshot)
    }
    
    private func applyItems(_ items: [ItemInfo]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    private func bind(){
     
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink{ items in
                self.applyItems(items)
            }.store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink{ item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                vc.viewModel = DetailViewModel(natwork: NetworkService(configuration: .default), iteminfo: item)
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
        
        
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
}

extension HomeViewcontroller: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.item]
        viewModel.itemTapped.send(item)
    }
}


