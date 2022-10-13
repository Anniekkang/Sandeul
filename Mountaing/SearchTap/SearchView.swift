//
//  SearchView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit

class SearchView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = colorCustom.shared.creamBackgroundColor
        return view
    }()
    
    override func configuration() {
        self.addSubview(tableView)
    }
    
    override func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    
    
}
