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
        label.textColor = colorCustom.shared.lightBlackColor
        label.textAlignment = .left
        label.font = Font.customfirst.otherlargeFont
       
        
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
            make.top.leading.equalTo(contentView).inset(20)
            make.bottom.trailing.equalTo(contentView).offset(-20)
        
        }
        
        typeLabel.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width).multipliedBy(0.4)
            make.leading.equalTo(stackView.snp.leading)
            make.top.bottom.equalTo(stackView)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(stackView)
           // make.width.equalTo(stackView.snp.width).multipliedBy(0.6)
            make.trailing.equalTo(stackView.snp.trailing)
        }
        
    }
}
