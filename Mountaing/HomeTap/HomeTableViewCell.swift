//
//  HomeTableViewCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/15.
//

import UIKit

class HomeTableViewCell: BaseTableViewCell {
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override func configure() {
        self.addSubview(label)
    }
    
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalTo(10)
        }
    }
    
   
    
}

