//
//  SearchExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

extension SearchViewController : UISearchResultsUpdating {


    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        //update searchBarText to realm
        //if let searchText = localRealm.objects(MountainModel.self).filter(NSPredicate(format: "text = %@", text)).first {
            try! localRealm.write {
                MountainModel().text = text
            }
        //}

       
        filteredRealm = localRealm.objects(MountainModel.self).filter({ $0.title.contains(text) == true
        })
        dump(filteredRealm)
        mainView.tableView.reloadData()
    }
    
}


