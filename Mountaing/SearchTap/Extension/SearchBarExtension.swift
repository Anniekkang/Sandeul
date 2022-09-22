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
        self.filteredArray = self.items.filter { $0.mntnnm.localizedCaseInsensitiveContains(text) || $0.mntninfohght.localizedCaseInsensitiveContains(text)}
          dump(filteredArray)
       
        mainView.tableView.reloadData()
    }
    
}


