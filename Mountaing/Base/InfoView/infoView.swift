//
//  infoView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

class infoView: BaseView {

    let ImageView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
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
    }

}
