//
//  InfoViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift


class InfoViewController: BaseViewController {
    
    
    let localRealm = try! Realm()
    
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
        }
    }
    
    
    var mainView = infoView()
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        
    }
    
    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.reuseIdentifier)
        mainView.backgroundColor = .white
    }
    
}

extension InfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseIdentifier, for: indexPath) as! InfoTableViewCell
        cell.backgroundColor = .systemGray6
        cell.infoLabel.font = Font.customfirst.mediumFont
        cell.typeLabel.font = Font.customfirst.smallFont
        
        let selectedCell = localRealm.objects(MountainModel.self).filter("selected == true")
        
        print("=========================\(selectedCell)")
        
        
        switch indexPath.row {
        case 0:
            cell.typeLabel.text = "이름"
            cell.infoLabel.text = selectedCell.first?.title
        case 1:
            cell.typeLabel.text = "위치"
            cell.infoLabel.text = selectedCell.first?.location
        case 2:
            cell.typeLabel.text = "고도"
            cell.infoLabel.text = selectedCell.first?.altitude
        case 3:
            cell.typeLabel.text = "난이도"
            cell.infoLabel.text = selectedCell.first?.difficulty
        case 4:
            cell.typeLabel.text = "설명"
            cell.infoLabel.text = selectedCell.first?.contents
            
            try! localRealm.write {
                selectedCell.first?.selected = false
            }
        default :
            return cell 
            
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
