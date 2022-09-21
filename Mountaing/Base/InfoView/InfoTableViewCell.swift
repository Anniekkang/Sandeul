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
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    let infoLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        return view
    }()
    
    override func configure() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(infoLabel)
        
    }
    
    override func setConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.bottom.trailing.equalTo(contentView).offset(-10)
        
        }
        
        
    }
}
