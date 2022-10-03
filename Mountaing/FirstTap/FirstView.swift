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
        super.init(frame: frame)
        configuration()
        constraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            switch viewModel.section[section] {
            case HomeSection.First:
                return getLayoutFirstSection()
            case HomeSection.Second:
                return getLayoutSecondSection()
            default :
                return getLayoutSecondSection()
                
            }
        })
        view.backgroundColor = colorCustom.shared.whiteBackgroundColor
        
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
    
    
   static func getLayoutFirstSection() -> NSCollectionLayoutSection {
      // item
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(0.5),
        heightDimension: .fractionalHeight(1.0)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10)
      
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
        widthDimension: .fractionalWidth(0.9),
        heightDimension: .absolute(50)
    
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
       
      
      return section
        }
    
    static func getLayoutSecondSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10)
        
        // group
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(0.8)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 5
        )
       
        let headerSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.9),
          heightDimension: .absolute(50)
      
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top
        )
      
        // section
        let section = NSCollectionLayoutSection(group: group)
        //section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
         
         
        
        return section
        
    }
    


}
