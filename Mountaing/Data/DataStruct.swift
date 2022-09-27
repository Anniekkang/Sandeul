//
//  DataStruct.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON

//XML로 부터 data를 받을 swift 구조체 -> APIManager 실행시 items에 저장됨

let localRealm = try! Realm()




struct Item  {
    var mntninfopoflc : String = ""//location
    var mntnnm : String = ""//mountainTitle
    var mntninfohght : String = ""//Altitude
    var mntnInfodtlinfocont : String = "" //contents
    var difficulty : String = ""//difficulty
    var mntnattchimageseq : String = "" //Image
    var searchBarText : String = ""//searchBar text
}

//struct를 저장할 model(object)
class RealmModuleModel : Object {
    @objc dynamic var title: String = ""
    @objc dynamic var altitude: String = ""
    @objc dynamic var difficulty : String = ""
    @objc dynamic var location : String = ""
    @objc dynamic var imageURL :String = ""
    @objc dynamic var contents : String = ""
    @objc dynamic var text : String = ""
    
}
extension Item : Persistable {
    
    init(managedObject: RealmModuleModel) {
        self.mntnnm = managedObject.title
        self.difficulty = managedObject.difficulty
        self.mntninfopoflc = managedObject.location
        self.mntninfohght = managedObject.altitude
        self.mntnInfodtlinfocont = managedObject.contents
        self.mntnattchimageseq = managedObject.imageURL
      
    }


    //struct -> object로 변경
    func managedObject() -> RealmModuleModel {
        let module = RealmModuleModel()
        module.title = self.mntnnm
        module.altitude = self.mntninfohght
        module.difficulty = self.difficulty
        module.contents = self.mntnInfodtlinfocont
        module.location = self.mntninfopoflc
        module.imageURL = self.mntnattchimageseq
    
        return module
    }

}

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}


//비어있는 object list
class newModel : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var altitude : String = ""
    @objc dynamic var difficulty : String = ""
    @objc dynamic var contents : String = ""
    @objc dynamic var location : String = ""
    @objc dynamic var imageURL : String = ""
    let moduleList = List<RealmModuleModel>()
    
}


func saveModuleList(moduleList:[Item]) {
        if let appSettingModel = localRealm.objects(newModel.self).first {
            try! localRealm.write{
                appSettingModel.moduleList.removeAll()
                moduleList.forEach { module in
                    print("module \(module)")
                    appSettingModel.moduleList.append(module.managedObject())
                    print("-------\(#function)")
                }
            }
        }
    }
