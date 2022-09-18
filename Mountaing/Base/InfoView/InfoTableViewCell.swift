//
//  InfoTableViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit


class InfoTableViewCell: BaseTableViewCell {

    let label : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override func configure() {
        self.addSubview(label)
    }
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(5)
        }
    }
}
