//
//  DetailView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/14.
//

import UIKit
import SnapKit
import SwiftUI

class DetailView: BaseView {
    
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.2)
        return view
    }()
    
    let imageButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(systemName: "camera.viewfinder"), for: .normal)
        return button
    }()
    

    let dateLabel : baseLabel = {
        let label = baseLabel()
        
       
        return label
    }()
    
//    let picker : UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.3)
//        picker.layer.cornerRadius = 10
//        picker.datePickerMode = .date
//        picker.locale = Locale(identifier: "ko_KR")
//        picker.preferredDatePickerStyle = .compact
//        picker.contentHorizontalAlignment = .center
//        picker.sizeToFit()
//
//        return picker
//    }()
    
        let titleLabel : BaseTextField = {
           let view = BaseTextField()
            view.placeholder = "산 이름을 입력하시오"
            
            return view
    
        }()
    
    
   
    
    let contentLabel : UITextView = {
        let view = UITextView()
        view.layer.cornerRadius = 10
        view.textAlignment = .left
        view.textColor = colorCustom.shared.lightBlackColor
        view.font = Font.customfirst.mediumFont
        view.backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.5)
        return view
    }()
    
    let rateLabel : BaseTextField = {
        let view = BaseTextField()
        view.placeholder = "별점을 고르시오"
       
        return view
        
    }()
    
    let locationLabel : baseLabel = {
       let label = baseLabel()
        label.text = "위치"
        return label
    }()
    
    let stackView : UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        view.distribution = .fill
        return view
    }()
    
    override func configuration() {
        [titleLabel,dateLabel,locationLabel,rateLabel,stackView].forEach {
            self.addSubview($0)
        }
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(contentLabel)
        imageView.addSubview(imageButton)
    }
    
    override func setConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalToSuperview().inset(80)
            make.height.equalToSuperview().multipliedBy(0.08)
            
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.08)
        }
        locationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.08)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(locationLabel.snp.bottom).offset(50)
            make.height.equalToSuperview().multipliedBy(0.2)
            
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(stackView)
            make.leading.top.bottom.equalTo(stackView)
            make.width.equalTo(imageView.snp.height)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.height.equalTo(stackView)
            make.trailing.top.bottom.equalTo(stackView)
        }
        
        
        rateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.height.equalToSuperview().multipliedBy(0.08)
        }
        
        imageButton.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(imageView)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        
    }
}
