//
//  infoView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

class infoView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    let ImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 100
        view.layer.borderColor = colorCustom.shared.greenColor.cgColor
        view.image = UIImage(named: "북한산")
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.borderWidth = 1
//        view.layer.shadowRadius = 8
//        view.layer.shadowOpacity = 0.8
        
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
            make.top.trailing.leading.equalTo(safeAreaLayoutGuide).inset(40)
            make.height.equalTo(ImageView.snp.width)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(ImageView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
    }

}
