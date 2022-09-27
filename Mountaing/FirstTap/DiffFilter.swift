//
//  ElseViewExtension.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/27.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

extension FirstViewController {
    
    func filterForBeginner() -> [MountainModel] {
       
        let convertedArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }
        let beginnerArray = convertedArray.filter { $0.difficulty == "초급" }
        var indexArray : [Int] = [0,0,0,0,0]
        var result : [MountainModel] = []
        
        for i in 0...4 {
            let randomNum =  Int.random(in: 0..<beginnerArray.count)
            indexArray[i] = randomNum
            result.append(beginnerArray[randomNum])
        }
  
        return result
  
    }
    
    func filterForAdvanced() -> [MountainModel] {
        let convertedArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }
        let advancedArray = convertedArray.filter { $0.difficulty == "상급" }
        var indexArray : [Int] = [0,0,0,0,0]
        var result : [MountainModel] = []
        
        for i in 0...4 {
            let randomNum =  Int.random(in: 0..<advancedArray.count)
            indexArray[i] = randomNum
            result.append(advancedArray[randomNum])
        }
  
        return result
  
    }
    
    
    
    
    
    
}
