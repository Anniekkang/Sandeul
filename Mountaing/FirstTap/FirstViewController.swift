//
//  FirstViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit

class FirstViewController: BaseViewController {

    var mainView = FirstView()
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
       
        
    }
    
    override func configuration() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                flowLayout.itemSize = CGSize(width: 100, height: 100)
        mainView.collectionView.collectionViewLayout = flowLayout
        mainView.collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
    }


}

extension FirstViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! Header
        
        return header
    }
    
    
    func firstSectionLayout() -> UICollectionViewCompositionalLayout {
       let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
       item.contentInsets = .init(top: 0, leading: 5, bottom: 16, trailing: 5)
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),heightDimension: .estimated(200))
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
   
       let section = NSCollectionLayoutSection(group: group)
       section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: "", alignment: .topLeading)]
       
       section.orthogonalScrollingBehavior = .groupPaging
       section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
       
       let layout = UICollectionViewCompositionalLayout(section: section)
       
       return layout
   }
   
    
}
