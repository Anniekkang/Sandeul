//
//  BaseCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
    func setConstraints() {}
}
    

