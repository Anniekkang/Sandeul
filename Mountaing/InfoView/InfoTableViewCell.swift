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
        label.textAlignment = .center
        label.font = Font.customfirst.mediumFont
        
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = Font.customfirst.othermediumFont
       
        
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.spacing = 20
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
            make.top.leading.equalTo(contentView).offset(20)
            make.bottom.trailing.equalTo(contentView).offset(-20)
        
        }
        
//        typeLabel.snp.makeConstraints { make in
//            make.width.equalTo(stackView.snp.width).multipliedBy(0.4)
//        }
//
//        infoLabel.snp.makeConstraints { make in
//            make.height.equalTo(stackView.snp.height)
//            make.width.equalTo(stackView.snp.width).multipliedBy(0.6)
//        }
        
    }
}
