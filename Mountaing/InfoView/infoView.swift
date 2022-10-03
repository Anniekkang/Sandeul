//
//  infoView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

class infoView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    let ImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.layer.borderColor = colorCustom.shared.greenColor.cgColor
        view.image = UIImage(named: "북한산")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        //view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        
        //view.layer.cornerRadius = 40
        //view.layer.cornerCurve = .circular
        
        print("===================width : \(view.frame.height)")
        
        return view
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = colorCustom.shared.whiteBackgroundColor
        
        return view
    }()
    
    override func configuration() {
        [ImageView,tableView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func constraints(){
        ImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(140)
            make.height.equalTo(ImageView.snp.width)
            
        
         
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(ImageView.snp.bottom).offset(50)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
    }

}
