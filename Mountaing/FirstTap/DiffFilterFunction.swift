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
    

    
    func filterArry(difficulty : String) -> [MountainModel] {
       
        let convertedArray : [MountainModel] = localRealm.objects(MountainModel.self).map { $0 }//배열로바꿔줌
        let filtered = convertedArray.filter { $0.difficulty == difficulty }
        var indexArray : [Int] = []
        var result : [MountainModel] = []
        print(filtered)
        
       // make indexArray = [0,0,0,0,0]
        while indexArray.count < 5 {
           
            let randomNum =  Int.random(in: 0..<filtered.count)
            indexArray.append(randomNum)//not working

            //바보 짓함...
//            if indexArray.contains(randomNum) {
//                indexArray.removeLast()
//            }
            print("==indexArray: \(indexArray)")
        }
       
       
        for i in 0...4 {
            result.append(filtered[indexArray[i]])
        }

        return result//랜덤 5개의 mountainModel을 배열로 뱉음
    }
  
    
}
