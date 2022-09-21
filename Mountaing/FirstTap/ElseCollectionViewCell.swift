//
//  ElseCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/19.
//

import UIKit

class ElseCollectionViewCell: BaseCollectionViewCell {

        let titleLabel : UILabel = {
            let label = UILabel()
            //label.font = Font.customfirst.mediumFont
            labelUI(label: label, color : UIColor.black)
            return label
        }()
        
        let rankingLabel : UILabel = {
            let label = UILabel()
            //label.font = Font.customfirst.mediumFont
            labelUI(label: label, color : UIColor.black)
            return label
        }()
        
        let miniimage : UIImageView = {
            let view = UIImageView()
            view.layer.cornerRadius = 8
            return view
            
        }()
        
        let altitudeLabel : UILabel = {
            let label = UILabel()
            //label.font = Font.customfirst.smallFont
            labelUI(label: label, color: UIColor.systemGray6)
            return label
            
        }()
    
      
        let stackView : UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 5
            return stack
        }()

        override func configure() {
            
            [rankingLabel,stackView,miniimage].forEach {
                contentView.addSubview($0)
            }
            
            [titleLabel,altitudeLabel].forEach {
                stackView.addArrangedSubview($0)
            }
            
            
        }
    
    override func setConstraints() {
        rankingLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(10)
            make.width.equalTo(self.snp.height)
        }
        
        miniimage.snp.makeConstraints { make in
            make.top.bottom.equalTo(10)
            make.leading.equalTo(rankingLabel.snp.trailing).offset(10)
            make.width.equalTo(self.snp.height).multipliedBy(1.2)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(10)
            make.leading.equalTo(rankingLabel.snp.trailing).offset(10)
            make.trailing.equalTo(self).offset(-10)
            
        }
        
     
    }
        
        
        
        
    }



