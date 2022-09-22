//
//  TableViewExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/22.
//

import UIKit


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredArray.count : self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        cell.backgroundColor = .white
        
        
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
