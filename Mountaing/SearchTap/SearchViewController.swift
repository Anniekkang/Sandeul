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
        
        configuration()
        setParser(from: APIKey.url)
        
        naviDesign()
        
        mainView.tableView.reloadData()
        
        
    }
    
    func naviDesign(){
        
        
        
        
    }
    
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
        
        
        
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때
        
        var isSearchBarEmpty : Bool {
            return searchController.searchBar.text?.isEmpty ?? true
            
        }
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = UIColor.systemGreen
        
        searchController.searchBar.delegate = self
        searchController.delegate = self
        
        
        
    }
    
    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredArray.count : self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        cell.backgroundColor = .white
        
        //true = 활성화됨
        if self.isFiltering {
            if indexPath.row < filteredArray.count {
                cell.titleLabel.text = self.filteredArray[indexPath.row].mntnnm
                cell.contentLabel.text = "\(self.filteredArray[indexPath.row].mntninfohght)m"
            } else { 
                }
            }
        
        cell.titleLabel.text = items[indexPath.row].mntnnm
        cell.contentLabel.text = "\(items[indexPath.row].mntninfohght)m"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
