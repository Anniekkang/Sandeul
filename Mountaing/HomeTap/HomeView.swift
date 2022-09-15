//
//  HomeView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/13.
//

import UIKit
import SnapKit

class HomeView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.backgroundColor = .orange
        return view
    }()
    
    static func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        let itemWidth: CGFloat = deviceWidth / 2
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.scrollDirection = .horizontal
        return layout
        
        
    }
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = .clear
        view.rowHeight = 100
        return view
        
    }()
    
    override func configuration() {
        [collectionView,tableView].forEach {
            self.addSubview($0)
        }
    }
    
    override func constraints() {
       
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
            
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottomMargin).inset(30)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
            
        }
        
        
        
    }

