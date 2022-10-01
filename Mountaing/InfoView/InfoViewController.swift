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
    
    
    
    var testtasks : Results<MountainModel>! {
        didSet {
            print("test tasked changed!")
            print("1-testtasks : \(testtasks)")
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
        mainView.backgroundColor = colorCustom.shared.whiteBackgroundColor
    }
    
}

extension InfoViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseIdentifier, for: indexPath) as! InfoTableViewCell
        cell.backgroundColor = colorCustom.shared.creamBackgroundColor

        
       
       
        let array = ["이름","위치","고도","난이도","설명"]
        
        cell.typeLabel.text = array[indexPath.row]
       
        print(testtasks)
        switch indexPath.row
        {
        case 0:
            cell.infoLabel.text = testtasks.first?.title
        case 1:
            cell.infoLabel.text = testtasks.first?.location
        case 2:
            cell.infoLabel.text = testtasks.first?.altitude
        case 3:
            cell.infoLabel.text = testtasks.first?.difficulty
        case 4:
            cell.infoLabel.text = testtasks.first?.contents
            
        default :
            break
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
   
}
