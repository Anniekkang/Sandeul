//
//  FirstCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    
    
}
