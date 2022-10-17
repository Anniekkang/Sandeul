//
//  BaseTextField.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/17.
//

import UIKit

class BaseTextField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        layer.cornerRadius = 10
        textAlignment = .center
        font = Font.customfirst.mediumFont
        textColor = colorCustom.shared.lightBlackColor
        backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.4)
       
    }
}
