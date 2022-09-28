//
//  FirstViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift


class FirstViewController: BaseViewController {
    
    var beginnerArray : [MountainModel]?
    var advancedArray : [MountainModel]?
    
    let url = APIKey.url
    let localRealm = try! Realm()
    
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
            mainView.collectionView.reloadData()
        }
    }
    
    var currentElement : String = ""
    var item : Item?
    var items : [Item] = []
    
    
    let font = FontManager.getFont()
    
    var mainView = FirstView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .white
        configuration()
        
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
    }
    
    
    override func configuration() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(ElseCollectionViewCell.self, forCellWithReuseIdentifier: ElseCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
    
    
}

extension FirstViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else if section == 1{
            return 5
        } else {
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            
            cell.backgroundColor = .systemGray6
            return cell
            
        } else  if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            beginnerArray = filterArry(difficulty: "초급")
            print("===================================filter:\(filterArry(difficulty: "초급"))")
          
            cell.titleLabel.text = beginnerArray![indexPath.section].title
            cell.altitudeLabel.text = beginnerArray![indexPath.row].altitude
            
            // cell.miniimage =
            
            cell.backgroundColor = .yellow
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            advancedArray = filterArry(difficulty: "상급")
            
            cell.titleLabel.text = advancedArray![indexPath.row].title
            cell.altitudeLabel.text = advancedArray![indexPath.row].altitude
            
            cell.backgroundColor = .yellow
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0 :
                try! localRealm.write {
                    beginnerArray![0].selected = true
                    print("---------------------------\(beginnerArray![0])----------------")
                }
            case 1 :
                try! localRealm.write {
                    beginnerArray![1].selected = true
                }
            case 2 :
                try! localRealm.write {
                    beginnerArray![2].selected = true
                }
            case 3 :
                try! localRealm.write {
                    beginnerArray![3].selected = true
                }
            case 4 :
                try! localRealm.write {
                    beginnerArray![4].selected = !beginnerArray![4].selected
                }
            default:
                return
            }
            
        } else if indexPath.section == 2 {
            try! localRealm.write {
                advancedArray![indexPath.row].selected = !advancedArray![indexPath.row].selected
            }
            
            
            
        }
        
        try! localRealm.write {
            beginnerArray![indexPath.row].selected = !beginnerArray![indexPath.row].selected
        }
        
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! Header
        if indexPath.section == 0 {
            header.label.text = "근처에 있는 산"
        } else if indexPath.section == 1 {
            header.label.text = "초급자를 위한 산"
        } else {
            header.label.text = "상급자를 위한 산"
        }
        
        
        return header
    }
    
    
    
    
}
