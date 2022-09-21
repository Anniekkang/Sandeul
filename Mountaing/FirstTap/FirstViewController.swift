//
//  FirstViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/17.
//

import UIKit
import SwiftUI
import Alamofire
import SwiftyXMLParser

class FirstViewController: BaseViewController {

    let font = FontManager.getFont()
    var mainView = FirstView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        
        
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
        } else {
            return 5
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            cell.backgroundColor = .systemGray6
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            cell.backgroundColor = .yellow
            return cell
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! Header
        if indexPath.section == 0 {
            header.label.text = "가까운 산"
        } else if indexPath.section == 1 {
            header.label.text = "쉬운 산 TOP5"
        } else {
            header.label.text = "어려운 산 TOP5"
        }
       
        
        return header
    }

    
}

