//
//  DataStruct.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

//XML로 부터 data를 받을 swift 구조체 -> APIManager 실행시 items에 저장됨

struct Item  {
    var mntninfopoflc : String?//location
    var mntnnm : String?//mountainTitle
    var mntninfohght : String?//Altitude
    var mntnInfodtlinfocont : String? //contents
    var difficulty : String?//difficulty
    var mntnattchimageseq : String? //Image
}


