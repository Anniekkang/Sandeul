//
//  HomeCollectionViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .clear
        return view
        
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let contentsLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        return stackView
    }()
    
    
    override func configure() {
        [titleLabel,contentsLabel].forEach {
            stackView.addSubview($0)
        }
        
        [imageView,stackView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.topMargin.bottomMargin.leadingMargin.trailingMargin.equalTo(0)
        }
        
        stackView.snp.makeConstraints { make in
            make.topMargin.equalTo(20)
            make.leadingMargin.equalTo(10)
            make.trailingMargin.equalTo(-10)
            make.height.equalTo(imageView).multipliedBy(0.4)
            
        }
        
        
    }
    
    
}
