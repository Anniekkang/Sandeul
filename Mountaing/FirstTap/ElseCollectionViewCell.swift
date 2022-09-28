//
//  ElseCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/19.
//

import UIKit

class ElseCollectionViewCell: BaseCollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
        let titleLabel : UILabel = {
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
            
            [stackView,miniimage].forEach {
                contentView.addSubview($0)
            }
            
            [titleLabel,altitudeLabel].forEach {
                stackView.addArrangedSubview($0)
            }
            
            
        }
    
    override func setConstraints() {
        
        
        miniimage.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).inset(10)
            make.width.equalTo(contentView.snp.height).multipliedBy(1.2)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(miniimage.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            
        }
        
     
    }
        
        
        
        
    }



