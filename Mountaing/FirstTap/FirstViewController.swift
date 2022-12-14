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
import CoreLocation
import Kingfisher


class FirstViewController: BaseViewController  {
    
    
    
    
    
    let url = APIKey.url
    let localRealm = try! Realm()
    var randomNum : Int = 0
    var filtered : [MountainModel] = []
    var locationManger : CLLocationManager!
    var region : String = "서울"
    
    
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
            
        }
    }
    
    
    
    
    
    
    let font = FontManager.getFont()
    
    var array : [MountainModel] = []
    
    var mainView = FirstView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        array = self.localRealm.objects(MountainModel.self).filter("location contains '\(region)'") //.map { $0 }.shuffled()
        //   print(array.count)
        locationManger = CLLocationManager()
        locationManger.delegate = self
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
        filtered = filtered.shuffled()
        array = array.shuffled()
        
     
        configuration()
        self.navigationItem.titleView = logoSetup()

        
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
            print(locationManger.location?.coordinate)
            print("=======region11:\(region)")
        } else {
            print("위치 서비스 Off 상태")
        }
        
        
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
        if indexPath.section == 0 {
            
            print(#function)
            print(indexPath)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            
            let imageName = ["산1", "산2", "산3","산4","산5"]
            cell.imageView.image = UIImage(named: imageName[indexPath.row])
            print("before")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self] in
                array = localRealm.objects(MountainModel.self).where({ $0.location.contains("\(region)")}).map{ $0 }
                print("========array : \(array)")
                cell.titleLabel.text = array[indexPath.row].title
                cell.heightLabel.text = "\(array[indexPath.row].altitude)m"
                cell.regionLabel.text = region
                
               
            })
            
            
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            filtered = localRealm.objects(MountainModel.self).filter { $0.altitude < 100 }
            print("filtered========\(filtered)")
            cell.miniimage.image = UIImage(named: "mountain")
            cell.titleLabel.text = filtered[indexPath.row].title
            cell.altitudeLabel.text = "\(filtered[indexPath.row].altitude)m"
            
            
            cell.backgroundColor = colorCustom.shared.creamBackgroundColor
            cell.layer.cornerRadius = 16
            cell.layer.shadowOpacity = 0.1
            cell.layer.shadowRadius = 4
            
          
            
            return cell
            
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            filtered = localRealm.objects(MountainModel.self).filter("difficulty = '상급'").map{ $0 }
            
            cell.titleLabel.text = filtered[indexPath.row].title
            cell.altitudeLabel.text = "\(filtered[indexPath.row].altitude)m"
            
            cell.miniimage.image = UIImage(named: "mountain")
            cell.backgroundColor = colorCustom.shared.creamBackgroundColor
            cell.layer.cornerRadius = 16
            cell.layer.shadowOpacity = 0.1
            cell.layer.shadowRadius = 4
            
            return cell
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.section == 0 {
            guard let selectedCell = collectionView.cellForItem(at: indexPath) as? FirstCollectionViewCell else { return }
            
            tasks = localRealm.objects(MountainModel.self).filter("title == '\(selectedCell.titleLabel.text!)'")
            
            
        } else {
            
            guard let selectedCell = collectionView.cellForItem(at: indexPath) as? ElseCollectionViewCell else { return }
            
            tasks = localRealm.objects(MountainModel.self).filter("title == '\(selectedCell.titleLabel.text!)'")
            
            
        }
        let vc = InfoViewController()
        vc.testtasks = tasks
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! Header
        if indexPath.section == 0 {
            header.label.text = "같은 지역에 있는 산"
        } else if indexPath.section == 1 {
            header.label.text = "산책하기 좋은 산"//고도 200미터 이하의 산
        } else {
            header.label.text = "도전적인 산"//고도 1000미터 이상(상급)
        }
        
        
        return header
    }
    
    
}


