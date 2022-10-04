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
    var firstArray : [MountainModel] = []
    var secondArray : [MountainModel] = []
    var locationManger : CLLocationManager!
    var region : String = "서울"
    
    
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
            
        }
    }
    
    
    
    
    var currentElement : String = ""
    var item : Item?
    var items : [Item] = []
    
    
    let font = FontManager.getFont()
    
    var array : Results<MountainModel>!
    
    var mainView = FirstView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        array = self.localRealm.objects(MountainModel.self).filter("location contains '\(region)'") //.map { $0 }.shuffled()
        print(array.count)
        locationManger = CLLocationManager()
        locationManger.delegate = self
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
        
        
        configuration()
        navDesign()
        
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManger.startUpdatingLocation() //위치 정보 받아오기 시작
            print(locationManger.location?.coordinate)
        } else {
            print("위치 서비스 Off 상태")
        }
        
        
    }
    
    
    func navDesign(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        
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
                MountainModel.model = self.localRealm.objects(MountainModel.self).filter("location contains '\(region)'").map { $0 }.randomElement()!
                cell.titleLabel.text = MountainModel.model.title
                cell.heightLabel.text = "\(MountainModel.model.altitude)m"
                let cityName = MountainModel.model.location.components(separatedBy: " ").first
                cell.regionLabel.text = cityName
                
                cell.titleLabel.text = MountainModel.model.title
                cell.heightLabel.text = "\(MountainModel.model.altitude)m"
                
                
                print("randomMountain:\(String(describing: MountainModel.model))")
                print("indexPath:\(indexPath)")
                
                
                
                
                
            })
            
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            let filtered = localRealm.objects(MountainModel.self).filter { Int($0.altitude)! < 100 }
            
            
            MountainModel.model = filtered.randomElement()!
            firstArray.append(MountainModel.model)
            
            cell.miniimage.image = UIImage(named: "mountain")
            cell.titleLabel.text = MountainModel.model.title
            cell.altitudeLabel.text = "\(MountainModel.model.altitude)m"
            
            cell.backgroundColor = colorCustom.shared.creamBackgroundColor
            cell.layer.cornerRadius = 16
            cell.layer.shadowOpacity = 0.1
            cell.layer.shadowRadius = 4
            
            
            return cell
            
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ElseCollectionViewCell.reuseIdentifier, for: indexPath) as! ElseCollectionViewCell
            
            
            let filtered = localRealm.objects(MountainModel.self).filter("difficulty = '상급'")
            MountainModel.model = filtered.randomElement()!
            secondArray.append(MountainModel.model)
            
            
            
            cell.titleLabel.text = MountainModel.model.title
            cell.altitudeLabel.text = "\(MountainModel.model.altitude)m"
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


