//
//  FirstCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit


class FirstCollectionViewCell: UICollectionViewCell {
    
  
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
       
       
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 6
        
        
        return view
    }()
    
    let backGroundView : UIView = {
        let view = UIView()
        view.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.4)
       
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = Font.customfirst.superbigLagefont
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.font = Font.customfirst.largeFont
        label.textColor = colorCustom.shared.greenColor
        label.textAlignment = .center

        
        return label
    }()
    
    let regionLabel : UILabel = {
        let label = UILabel()
        label.font = Font.customfirst.smallFont //.systemFont(ofSize: 16, weight: .bold)
        label.textColor = colorCustom.shared.creamBackgroundColor
        label.textAlignment = .center
        label.text = "위치"
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fillEqually
        return view
    }()
    
   
    func configuration(){
       
        contentView.addSubview(imageView)
        imageView.addSubview(backGroundView)
        backGroundView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(heightLabel)
        stackView.addArrangedSubview(regionLabel)
        
        
        
        
        
        
    }
    
    func constraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            
        }
        
        backGroundView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        stackView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(20)
            make.bottom.trailing.equalTo(contentView).offset(-20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(stackView)
            make.height.equalTo(stackView).multipliedBy(0.7)
            make.width.equalTo(stackView)
            
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(stackView.spacing)
            make.width.equalTo(stackView)
            make.leading.trailing.equalTo(stackView)
            make.height.equalTo(stackView).multipliedBy(0.1)
           
            
        }
        
        regionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView)
            make.width.equalTo(stackView)
           // make.top.equalTo(heightLabel.snp.bottom).offset(stackView.spacing)
            make.height.equalTo(stackView).multipliedBy(0.1)
        }
        
    }
    
}
