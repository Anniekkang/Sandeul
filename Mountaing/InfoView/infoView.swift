//
//  infoView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

class infoView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    let ImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.layer.borderColor = colorCustom.shared.greenColor.cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.8
        view.layer.opacity = 0.4
        
        return view
    }()
    
    let normalImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.layer.borderColor = colorCustom.shared.greenColor.cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.8
        
        return view
    }()
      
    let backGroundLabel : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = Font.customfirst.largeFont
        label.text = "이미지 준비중"
        
        return label
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = colorCustom.shared.whiteBackgroundColor
        view.layer.borderColor = colorCustom.shared.greenColor.cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    override func configuration() {
        ImageView.addSubview(backGroundLabel)
        
    }
    
   

}
