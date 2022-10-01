//
//  TableViewExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/22.
//

import UIKit


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isFiltering ? filteredRealm.count : localRealm.objects(MountainModel.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        
        let modelArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }
        cell.backgroundColor = colorCustom.shared.whiteBackgroundColor
        
        //검색창이 활성화 될 때
        if self.isFiltering {
            
            if indexPath.row < filteredRealm.count {
                cell.titleLabel.text = filteredRealm[indexPath.row].title
                cell.locationLabel.text = "\(filteredRealm[indexPath.row].altitude)m"
                
            }
           
        } else {
            
            cell.titleLabel.text = modelArray[indexPath.row].title
            cell.locationLabel.text = modelArray[indexPath.row].location
        }
        return cell
    }
    

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchTableViewCell else { return }
        
        tasks = localRealm.objects(MountainModel.self).filter("title == '\(cell.titleLabel.text!)'")
        
        let vc = InfoViewController()
        vc.testtasks = tasks
        self.navigationController?.pushViewController(vc, animated: true)
   
}

    func fetchRealm(){
        tasks = localRealm.objects(MountainModel.self).sorted(byKeyPath: "title", ascending: true)
        print("==Realm is located at:", localRealm.configuration.fileURL!)
        
    }
}

