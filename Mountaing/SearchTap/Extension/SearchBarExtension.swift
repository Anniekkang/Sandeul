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
        guard let items = self.items , let item = self.item else { return }
        
        filteredStruct = items.filter({ $0.mntnnm?.contains(text) == true || $0.mntninfohght?.contains(text) == true})
        
        dump(filteredStruct)
        mainView.tableView.reloadData()
    }
    
}


