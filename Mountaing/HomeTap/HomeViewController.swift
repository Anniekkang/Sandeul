//
//  HomeViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/13.
//

import UIKit

class HomeViewController: BaseViewController {

    
    let mainView = HomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        configuration()
        mainView.tableView.flashScrollIndicators()
        
    }
    
    
    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        mainView.tableView.backgroundColor = .clear
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        mainView.collectionView.backgroundColor = .lightGray
        
    }

}


