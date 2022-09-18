//
//  DataStruct.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

//XML로 부터 data를 받을 swift 구조체
struct items {
    let item : [item]
}


struct item {
    var mntninfopoflc : String? //location
    var mntnNm : String? //mountainTitle
    var mntninfohght : Int? //Altitude
    var mntnInfodtlinfocont : String? //contents
    var difficulty : String? //difficulty
    var mntnattchimageseq : String? //Image
}


