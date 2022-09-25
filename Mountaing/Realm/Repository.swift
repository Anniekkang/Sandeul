//
//  Repository.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/25.
//

import UIKit
import RealmSwift


protocol MountainModelType {
    func fetch() -> Results<MountainModel>
    
    
    
}

//class Repository : MountainModelType {
//    func fetch() -> Results<MountainModel> {
//
//    }
//
//
    
    
//}
