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
    
        configuration()
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
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
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
       
   

    }

    func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        cell.backgroundColor = .white
        cell.titleLabel.text = elements[indexPath.row]["mntnnm"]
        cell.contentLabel.text = elements[indexPath.row]["mntninfodtlinfocont"]
        
        print("-------\(elements[indexPath.row])")
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
