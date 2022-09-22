//
//  SearchViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit



class SearchViewController: UIViewController,UISearchBarDelegate, UISearchControllerDelegate {
    
    var items : [item] = []
    var xmlDictionary : [String:String] = [:]
    var elementType : XMLKey?
    var element : item?
    
    var filteredArray : [item] = []
    
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
        setupSearchController()
        mainView.tableView.reloadData()
        mainView.tableView.keyboardDismissMode = .onDrag
        
        configuration()
        setParser(from: APIKey.url)
       
        
    }

    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때
//
//        var isSearchBarEmpty : Bool {
//            return searchController.searchBar.text?.isEmpty ?? true
//
//        }
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        
        
    }
    
    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
}

