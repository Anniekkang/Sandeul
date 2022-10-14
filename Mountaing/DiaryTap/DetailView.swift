//
//  DetailView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/14.
//

import UIKit
import SnapKit

class DetailView: BaseView {

    
    
    
    let imageView : UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 10
        view.backgroundColor = colorCustom.shared.lightgreenColor
        return view
    }()
    
    let imageButton : UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = button.frame.size.width * 0.5
        button.backgroundColor = colorCustom.shared.greenBackgroundColor
        return button
    }()
    
    var dateLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = colorCustom.shared.lightBlackColor
        label.font = Font.customfirst.mediumFont
        label.backgroundColor = colorCustom.shared.lightgreenColor
        return label
    }()
   
    let titleLabel : UITextField = {
       let view = UITextField()
        view.placeholder = "제목을 입력하시오"
        view.textAlignment = .left
        view.font = Font.customfirst.mediumFont
        view.textColor = colorCustom.shared.lightBlackColor
        view.backgroundColor = colorCustom.shared.lightgreenColor
        return view
        
    }()
    
    let contentLabel : UITextView = {
       let view = UITextView()
        view.textAlignment = .left
        view.textColor = colorCustom.shared.lightBlackColor
        view.font = Font.customfirst.mediumFont
        view.backgroundColor = colorCustom.shared.lightgreenColor
        return view
    }()

    
    override func configuration() {
        [imageView, titleLabel, contentLabel].forEach {
            self.addSubview($0)
        }
        imageView.addSubview(imageButton)
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self).inset(20)
            make.top.equalTo(self).inset(20)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.4)
      
        }
        
        imageButton.snp.makeConstraints { make in
            make.trailing.equalTo(imageView).inset(20)
            make.bottom.equalTo(imageView).inset(20)
            make.height.width.equalTo(100)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.1)
        }
        contentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.3)
        }
        
    }
}
