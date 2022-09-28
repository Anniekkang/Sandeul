//
//  SearchTableViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit

class SearchTableViewCell: BaseTableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.spacing = 5
        view.axis = .vertical
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = .black
        label.font = Font.customfirst.largeFont
        return label
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "location"
        label.textColor = colorCustom.shared.lightgreenColor
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    let image : UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func configure() {
        [titleLabel,locationLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        [stackView,image].forEach {
            self.addSubview($0)
        }
        
    }
    
    func constraints(){
    
        image.snp.makeConstraints { make in
            make.top.equalTo(self).inset(10)
            make.leading.equalTo(self).inset(5)
            make.bottom.equalTo(self).inset(5)
            make.width.equalTo(image.snp.height)
            
        }
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(stackView)
            make.height.equalTo(stackView).multipliedBy(0.2)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(10)
            make.leading.equalTo(image.snp.trailing).offset(15)
            make.trailing.equalTo(self).inset(5)
            make.bottom.equalTo(self).inset(5)
        }
        
        
        
        
    }
    
    
}
