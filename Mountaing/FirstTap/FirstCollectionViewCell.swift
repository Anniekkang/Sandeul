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
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 6
       
        
        
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let contentsLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .white
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentsLabel)
        
        
        
        
    }
    
    func constraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(stackView).multipliedBy(0.7)
            make.width.equalTo(stackView)
        }
        
    }
    
}
