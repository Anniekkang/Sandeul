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

class DataParsing : XMLParser {
    static let shared = DataParsing()
    var items: [item] = []
    var xmlDictionary: [String: String]?
    var elementType: XMLKey?
   
    func setParser(from url: URL) {
        let parser = XMLParser(contentsOf: url)
        parser!.delegate = self
        parser!.parse()
    }

}


extension DataParsing : XMLParserDelegate {
    
   
    
    // XML 파싱을 시작하는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case "item" :
            xmlDictionary = [:]
        case "mntninfopoflc" :
            elementType = .mntninfopoflc
        case "mntnNm" :
            elementType = .mntnNm
        case "mntninfohght" :
            elementType = .mntninfohght
        case "mntnInfodtlinfocont" :
            elementType = .mntnInfodtlinfocont
        case "mntnattchimageseq" :
            elementType = .mntnattchimageseq
            
        default :
            print("error")
        }
 
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
       
        guard let elementType = self.elementType else { return }
        xmlDictionary?.updateValue(string, forKey: elementType.rawValue)
    }
    
    // XML 파싱이 끝나는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        guard let xmlDictionary = self.xmlDictionary else { return }
        if elementName == "item" {
           var item = item()

            guard let mntninfohght = Int(xmlDictionary[XMLKey.mntninfohght.rawValue]!),
                let mntninfopoflc = xmlDictionary[XMLKey.mntninfopoflc.rawValue],
                let mntnNm = xmlDictionary[XMLKey.mntnNm.rawValue],
                let mntnattchimageseq = xmlDictionary[XMLKey.mntnattchimageseq.rawValue],
                let mntnInfodtlinfocont = xmlDictionary[XMLKey.mntnInfodtlinfocont.rawValue] else { return }
            
            let difficulty = difficultyCal(altitude: mntninfohght)
            
            item.mntninfohght = mntninfohght
            item.mntninfopoflc = mntninfopoflc
            item.mntnNm = mntnNm
            item.mntnattchimageseq = mntnattchimageseq
            item.mntnInfodtlinfocont = mntnInfodtlinfocont
            item.difficulty = difficulty
           
            
            items.append(item)
            print(items)
        }
        
        elementType = nil
    }
}
