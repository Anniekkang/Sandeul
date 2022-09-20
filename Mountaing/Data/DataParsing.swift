//
//  APIManager.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/15.
//

import UIKit
import Alamofire
import SwiftyJSON




enum XMLKey : String {
    case mntninfopoflc = "mntninfopoflc" //location
    case mntnNm = "mntnNm" //mountainTitle
    case mntninfohght = "mntninfohght" //Altitude
    case mntnInfodtlinfocont = "mntnInfodtlinfocont"//contents
    case mntnattchimageseq = "mntnattchimageseq" //Image
}



extension SearchViewController : XMLParserDelegate {
    
    // XML 파싱을 시작하는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
    }
    
    func difficultyCal(altitude : Int) -> String {
        if altitude > 1000 {
            return "상급"
        } else if altitude > 500 {
            return  "중급"
        } else {
            return "초급"
        }
    }
    
    // 태그의 Data가 string으로 들어옴
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)//공백없에주기
        if !data.isEmpty {
            xmlDictionary[currentElement] = data
              }
    }
    
    // XML 파싱이 끝나는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        elements.append(xmlDictionary)
        print("xmlDic : \(xmlDictionary)")
        print("--------Count:\(elements.count)")
        
       
 // let difficulty = difficultyCal(altitude: mntninfohght)
//
//        item.mntninfohght = mntninfohght
 //       item.mntninfopoflc = mntninfopoflc
//        item.mntnNm = mntnNm
//        item.mntnattchimageseq = mntnattchimageseq
//        item.mntnInfodtlinfocont = mntnInfodtlinfocont
//        // item.difficulty = difficulty

//
    }
   
}

