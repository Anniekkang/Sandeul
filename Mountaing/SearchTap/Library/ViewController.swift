//
//  ViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/20.
//

import UIKit
import InstantSearch

struct Item: Codable {
    let name: String
}

class ViewController: UIViewController {
    
    lazy var searchController = UISearchController(searchResultsController: hitsViewController)
    let hitsViewController = SearchResultsViewController()
    
    let searcher = HitsSearcher(appID: "latency",
                                apiKey: "1f6fd3a6fb973cb08419fe7d288fa4db",
                                indexName: "bestbuy")
    lazy var searchConnector = SearchConnector<Item>(searcher: searcher,
                                                     searchController: searchController,
                                                     hitsInteractor: .init(),
                                                     hitsController: hitsViewController)
    
    
    let statsInteractor = StatsInteractor()
    let filterState = FilterState()
    lazy var categoryConnector = FacetListConnector(searcher: searcher,
                                                    filterState: filterState,
                                                    attribute: "category",
                                                    operator: .and,
                                                    controller: categoryListController)
    
    lazy var categoryListController = FacetListTableController(tableView: categoryTableViewController.tableView)
    let categoryTableViewController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchConnector.connect()
        searcher.search()
        setupUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
    }
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.showsSearchResultsController = true
        searchController.automaticallyShowsCancelButton = false
        categoryTableViewController.title = "Category"
    }
    @objc func showFilters() {
        let navigationController = UINavigationController(rootViewController: categoryTableViewController)
        categoryTableViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissFilters))
        present(navigationController, animated: true, completion: .none)
    }
    
    @objc func dismissFilters() {
        categoryTableViewController.navigationController?.dismiss(animated: true, completion: .none)
    }
    
}



extension ViewController: StatsTextController {
    
    func setItem(_ item: String?) {
        title = item
    }
    
}
