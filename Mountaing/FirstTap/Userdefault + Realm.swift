//
//  Userdefault.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift


extension FirstViewController {
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        userDefault()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRealm()
    }
    
    //새로 업데이트된 realm을 가져오는 것
    func fetchRealm(){
        tasks = localRealm.objects(MountainModel.self).sorted(byKeyPath: "altitude", ascending: true)
        
    }
    
    func setDifficulty(altitude : Int) -> String?{
        if altitude > 1000 {
            return "상급"
        } else if altitude > 500 {
            return "중급"
        } else {
            return "초급"
        }
    }
    
    
    func userDefault(){
        print(#function)
        if UserDefaults.standard.bool(forKey: "first") == false {
            //api호출 && realm에 저장
            
            setParser(from: APIKey.url!)
            //saveModuleList(moduleList: items)
                
            try! localRealm.write {
                saveModuleList(moduleList: items)
                for i in 0...1337 {
                    let title = items[i].mntnnm
                    let contents = items[i].mntnInfodtlinfocont
                    let altitude = items[i].mntninfohght
                    let difficulty = items[i].difficulty
                    let imageURL = items[i].mntnattchimageseq
                    let location = items[i].mntninfopoflc

                    let task = MountainModel(title: title, contents: contents, difficulty: difficulty, altitude: altitude, location: location, imageURL: imageURL)

               
            
                localRealm.add(task)
                    
                    
                    
                }
                
              
            }
                    
                    
                  
                    
                
        
    
         

        print("realm success")
        
            
    }
}

}

