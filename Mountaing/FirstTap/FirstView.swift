//
//  FirstView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit
import SnapKit

class FirstView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: getLayoutConceptSection())
        
        return view
    }()
    
    override func configuration() {
        self.addSubview(collectionView)
    }
    
    override func constraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
   static func getLayoutConceptSection() -> UICollectionViewCompositionalLayout {
      // item
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.5),
        heightDimension: .fractionalHeight(1.0)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8)
      
      // group
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.9),
        heightDimension: .fractionalHeight(0.3)
      )
      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitems: [item]
      )
      
      let headerSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .absolute(40)
      )
      let header = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: headerSize,
        elementKind: UICollectionView.elementKindSectionHeader,
        alignment: .top
      )
    
      // section
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .continuous
      section.boundarySupplementaryItems = [header]
       
       let layout = UICollectionViewCompositionalLayout(section: section)
      
      return layout
        }
    
    
}

