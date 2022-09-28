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
    
    
    
    func begginerFilterArry() -> [MountainModel] {
        let filtered = localRealm.objects(MountainModel.self).filter("difficulty == '초급'")
        let convertedArray : [MountainModel] = filtered.map { $0 }//배열로바꿔줌
        var indexArray : [Int] = []
        var result : [MountainModel] = []
        
        
        
        for i in 0...4 {
            
            let randomNum =  Int.random(in: 0 ..< filtered.count)
            indexArray.append(randomNum)
            result.append(convertedArray[indexArray[i]])
            
           
        }
        
        
         print("===========indexArray : \(indexArray[1])")
         print("===========convert[1] : \(convertedArray[indexArray[1]])")
         print("===========result[1] : \(result[1])")
        
        return result//랜덤 5개의 mountainModel을 배열로 뱉음
    }
    
    
}
