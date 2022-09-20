//
//  SearchLibraryViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/20.
//

import UIKit
import InstantSearch

class ViewController: UIViewController {
      
  lazy var searchController = UISearchController(searchResultsController: hitsViewController)
  let hitsViewController = SearchLibraryViewController()

  let searcher = HitsSearcher(appID: "latency",
                              apiKey: "1f6fd3a6fb973cb08419fe7d288fa4db",
                              indexName: "bestbuy")
  lazy var searchConnector = SearchConnector<Item>(searcher: searcher,
                                                    searchController: searchController,
                                                    hitsInteractor: .init(),
                                                    hitsController: hitsViewController)
  
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
  }
      
}
