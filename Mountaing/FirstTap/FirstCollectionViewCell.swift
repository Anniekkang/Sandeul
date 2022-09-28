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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
       
       
        
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let contentsLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    
    func configuration(){
        self.contentView.addSubview(imageView)
        self.imageView.addSubview(stackView)
        self.stackView.addArrangedSubview(contentsLabel)
        self.stackView.addArrangedSubview(titleLabel)
        
        
        
    }
    
    func constraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(imageView).inset(5)
        }
        
    }
    
}
