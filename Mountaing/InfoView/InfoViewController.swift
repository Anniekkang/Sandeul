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
import Kingfisher


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
        mainView.ImageView.layer.cornerRadius = 12
        mainView.normalImageView.layer.cornerRadius = 12
        
        mainView.addSubview(mainView.tableView)
        
        
        
        
        let imageAddress = URL(string: ImageURL.frontURL + testtasks.first!.imageURL)
        if testtasks.first!.imageURL == "atchFileId=" {
            mainView.addSubview(mainView.ImageView)
            mainView.ImageView.image = UIImage(named: "basic2-1")
            
            mainView.tableView.snp.makeConstraints { make in
                make.top.equalTo(mainView.ImageView.snp.bottom).offset(20)
                make.leading.trailing.equalTo(mainView).inset(20)
                make.bottom.equalTo(mainView).inset(20)
            }
            
            
            mainView.ImageView.snp.makeConstraints { make in
                make.top.equalTo(mainView.safeAreaLayoutGuide).inset(40)
                make.leading.trailing.equalTo(mainView).inset(20)
                make.height.equalTo(mainView).multipliedBy(0.3)
           
            }
            
            mainView.backGroundLabel.snp.makeConstraints { make in
                make.centerX.centerY.equalTo(mainView.ImageView)
            }
            
            
            
        } else {
            mainView.addSubview(mainView.normalImageView)
            mainView.normalImageView.kf.setImage(with: imageAddress)
            
            mainView.tableView.snp.makeConstraints { make in
                make.top.equalTo(mainView.normalImageView.snp.bottom).offset(20)
                make.leading.trailing.equalTo(mainView).inset(20)
                make.bottom.equalTo(mainView).inset(20)
            }
            
            mainView.normalImageView.snp.makeConstraints { make in
                make.top.equalTo(mainView.safeAreaLayoutGuide).inset(40)
                make.leading.trailing.equalTo(mainView).inset(20)
                make.height.equalTo(mainView).multipliedBy(0.3)
            }
            
        }
       
        print("ImageURL2 : \(ImageURL.frontURL)")
        print("imageURL : \(testtasks.first!.imageURL)")
        print("imageaddress : \(imageAddress)")
    }
    
}

extension InfoViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseIdentifier, for: indexPath) as! InfoTableViewCell
        cell.backgroundColor = colorCustom.shared.whiteBackgroundColor
        cell.selectionStyle = .none
        
        let array = ["이름","위치","고도","난이도","설명"]
       
        cell.typeLabel.text = array[indexPath.row]
        
        
        switch indexPath.row
        {
        case 0:
            cell.infoLabel.text = testtasks.first?.title
        case 1:
            cell.infoLabel.text = testtasks.first?.location
            cell.infoLabel.numberOfLines = 0
            cell.infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            tableView.rowHeight = UITableView.automaticDimension
          print("infoLabel :\(testtasks.first!.location)")
           
           
        case 2:
            cell.infoLabel.text = "\(testtasks.first!.altitude)m"
        case 3:
            cell.infoLabel.text = testtasks.first?.difficulty
        
            
            
        default :
            break
            
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
   
}
