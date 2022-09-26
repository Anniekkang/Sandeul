//
//  SearchViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit
import RealmSwift



class SearchViewController: UIViewController,UISearchBarDelegate, UISearchControllerDelegate {
    
    let localRealm = try! Realm()
    
    var currentElement : String = ""
    var item : Item?
    var items : [Item] = []
    var numberOfRows : Int = 10
    var filteredStruct : [Item] = []
    
    var isFiltering: Bool {
        
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive || isSearchBarHasText
        
    }
    
    var tasks : Results<MountainModel>! {
        didSet{
            mainView.tableView.reloadData()
            print("tasks changed")
        }
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
        setParser(from: APIKey.url!)
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        fetchRealm()
        
    }
    
    func fetchRealm() -> Results<MountainModel> {
        
       return localRealm.objects(MountainModel.self).sorted(byKeyPath: "title", ascending: true)
        
    }
    func setDifficulty(altitude : Int) -> String?{
        if altitude > 1000 {
            return "상급"
        } else if altitude > 500 {
            return "중급"
        } else {
            return "초급"
        }
    }
    
    
    func saveData(){
        guard let title = item?.mntnnm,
              let contents = item?.mntnInfodtlinfocont,
              let altitude = Int((item?.mntninfohght)!),
              let difficulty = setDifficulty(altitude: altitude),
              let location = item?.mntninfopoflc,
              let imageURL = item?.mntnattchimageseq else { return }
        
        let task = MountainModel(title: title, contents: contents, difficulty: difficulty, altitude: altitude, location: location, imageURL: imageURL)
        
        
        do {
            try localRealm.write{
                localRealm.add(task)
            }
        } catch let error {
            print(error)
        }
        
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
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때
        
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
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

