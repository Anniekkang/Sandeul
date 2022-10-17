//
//  BaseLabel.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/17.
//

import UIKit

class baseLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUp(){
        layer.masksToBounds = true
        layer.cornerRadius = 10
        textAlignment = .center
        textColor = .gray
        font = Font.customfirst.mediumFont
        backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.5)
        
        
       
        
    }
    
    
    
}
