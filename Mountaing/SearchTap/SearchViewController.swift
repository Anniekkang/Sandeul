//
//  SearchViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON


class SearchViewController: UIViewController {



    let localRealm = try! Realm()
    
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
        }
    }
    
    
    var filteredRealm : [MountainModel] = []
    var isFiltering: Bool {

        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false

        return isActive || isSearchBarHasText

    }

    var mainView = SearchView()
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        mainView.tableView.reloadData()
        mainView.tableView.keyboardDismissMode = .onDrag

        configuration()



    }

    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
}

