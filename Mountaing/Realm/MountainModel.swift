//
//  RealmModel.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/13.
//

import UIKit
import RealmSwift

 
class MountainModel : Object {
    
    static var model = MountainModel()
    
    @Persisted var title : String
    @Persisted var contents : String
    @Persisted var difficulty : String
    @Persisted var altitude : String
    @Persisted var location : String
    @Persisted var imageURL : String
    @Persisted var text : String
    @Persisted(primaryKey: true) var objectId : ObjectId
    
    convenience init(title : String, contents : String, difficulty : String, altitude : String, location : String, imageURL : String, text : String){
        self.init()
        self.title = title
        self.contents = contents
        self.difficulty = difficulty
        self.altitude = altitude
        self.location = location
        self.imageURL = imageURL
        self.text = text
    }

}

