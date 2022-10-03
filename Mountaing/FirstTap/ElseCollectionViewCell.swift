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
            label.font = Font.customfirst.otherextraLargefont
            labelUI(label: label, color : colorCustom.shared.lightBlackColor)
            return label
        }()
        
       
        let miniimage : UIImageView = {
            let view = UIImageView()
       
            view.layer.cornerRadius = 50
            let borderColor = colorCustom.shared.greenColor.cgColor
            view.layer.borderColor? = UIColor.white.withAlphaComponent(0.5).cgColor
            view.layer.borderWidth = 1
            view.layer.masksToBounds = true
            view.layer.shadowOpacity = 0.1
            view.layer.shadowRadius = 6
            return view
            
        }()
        
        let altitudeLabel : UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 18, weight: .bold)
            labelUI(label: label, color: colorCustom.shared.greenColor)
            return label
            
        }()
    
      
        let stackView : UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 25
            stack.distribution = .fillEqually
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
            make.top.bottom.equalTo(contentView).inset(15)
            make.leading.equalTo(contentView).inset(15)
            make.width.equalTo(contentView.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(miniimage.snp.trailing).offset(30)
            make.trailing.equalTo(contentView).offset(-10)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(stackView.snp.height)
            
        }
        
     
    }
        
   
    
        
        
    }



