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
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = .white
        return view
    }()
    
    override func configuration() {
        [ImageView,tableView].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func constraints(){
        ImageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(safeAreaLayoutGuide).inset(10)
            make.height.equalTo(ImageView.snp.width).multipliedBy(0.7)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(ImageView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
    }

}
