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
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    let collectionView : UICollectionView = {
        let view = UICollectionView()
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

}
