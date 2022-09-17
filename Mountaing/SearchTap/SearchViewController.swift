//
//  SearchViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit

class SearchViewController: BaseViewController {

    
    var mainView = SearchView()
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        self.navigationItem.searchController = searchController
        
        var isSearchBarEmpty : Bool {
            return searchController.searchBar.text?.isEmpty ?? true
            
        }

   

    }

}
