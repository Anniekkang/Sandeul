//
//  SearchViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit


class SearchViewController: UIViewController,UISearchBarDelegate, UISearchControllerDelegate {

    var xmlDictionary : [String:String] = [:]
    var currentElement = ""
    var elements : [[String:String]] = []
    
    let url = URL(string:endPoint.Endpoint + APIKey.Encoding)!
    var mainView = SearchView()
    override func loadView() {
        self.view = mainView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        setupSearchController()
        mainView.tableView.reloadData()
    
        setParser(from: url)
        
        
    }
    
    func setParser(from url: URL) {
        let parser = XMLParser(contentsOf: url)
        parser!.delegate = self
        if parser!.parse() {
            
            print("parsing succeed")
            
        } else {
            print("parsing error")
        }
        
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        self.navigationItem.searchController = searchController
        
        var isSearchBarEmpty : Bool {
            return searchController.searchBar.text?.isEmpty ?? true
            
        }
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = UIColor.systemGreen
        searchController.searchBar.delegate = self
        searchController.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.clear

   

    }

    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
