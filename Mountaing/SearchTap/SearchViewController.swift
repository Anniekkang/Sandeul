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


class SearchViewController: UIViewController,UISearchBarDelegate, UISearchControllerDelegate  {



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
       
        mainView.tableView.reloadData()
        mainView.tableView.keyboardDismissMode = .onDrag

        
        configuration()
        setupSearchController()


    }

    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
    
    func setupSearchController() {
             let searchController = UISearchController(searchResultsController: nil)
             searchController.searchBar.placeholder = "산 이름을 검색하시오"

             self.navigationItem.searchController = searchController
             self.navigationItem.title = "Search"
             self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때
             

             self.navigationItem.hidesSearchBarWhenScrolling = false
             searchController.obscuresBackgroundDuringPresentation = false
             definesPresentationContext = true
             searchController.searchResultsUpdater = self
             searchController.searchBar.delegate = self
             searchController.delegate = self


    }

}
