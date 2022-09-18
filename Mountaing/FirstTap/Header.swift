//
//  Header.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit
import SnapKit
import SwiftUI

class Header: UICollectionReusableView {

    let label = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Categories"
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = Font.happiness.largeFont
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
