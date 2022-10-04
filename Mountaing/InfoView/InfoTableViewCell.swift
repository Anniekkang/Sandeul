//
//  InfoTableViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit


class InfoTableViewCell: BaseTableViewCell {
    
   
    let typeLabel : UILabel = {
        let label = UILabel()
        label.textColor = colorCustom.shared.greenColor
        label.textAlignment = .left
        label.font = Font.customfirst.mediumFont
        
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.textColor = colorCustom.shared.lightBlackColor
        label.textAlignment = .left
        label.font = Font.customfirst.largeFont
       
        
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.spacing = 15
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    override func configure() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(infoLabel)

    }
    
    override func setConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.top.leading.equalTo(self)
            make.bottom.trailing.equalTo(self)
            
        }
        
        typeLabel.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width).multipliedBy(0.3)
            make.leading.equalTo(stackView)
            make.top.bottom.equalTo(stackView)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(stackView)
            make.trailing.equalTo(stackView)
        }
        
    }
}
