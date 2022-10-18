//
//  DiaryModel.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/17.
//
//
//import UIKit
//import RealmSwift
//
//class DiaryModel : Object {
//    
//    @Persisted var title : String?
//    @Persisted var date : String
//    @Persisted var location : String?
//    @Persisted var image : String?
//    @Persisted var content : String?
//    @Persisted var rate : String?
//    @Persisted(primaryKey: true) var objectId: ObjectId
//    
//    convenience init(title : String?, date : String, location : String?, image : String?, content : String?, rate : String?){
//        self.init()
//        self.title = title
//        self.date = date
//        self.location = location
//        self.image = image
//        self.content = content
//        self.rate = rate
//    }
//    
//    
//    
//}
//
//
