//
//  APIManager.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/15.
//

import UIKit
import Alamofire
import SwiftyJSON


extension SearchViewController : XMLParserDelegate {
    
    
    // XML 파싱을 시작하는 태그에서 이벤트 핸들링
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if elementName == "item" {
            item = Item()
        }
//
    }
    
    
    // 현재 태그에 담겨있는 값(string)이 들어옴
    func parser(_ parser: XMLParser, foundCharacters string: String) {
       
        
        if currentElement == "mntninfopoflc" {
            item?.mntninfopoflc = string
        } else if currentElement == "mntnnm" {
            item?.mntnnm = string
        } else if currentElement == "mntninfohght"{
            item?.mntninfohght = string
        } else if currentElement == "mntnattchimageseq"{
            item?.mntnattchimageseq = string
        } else if currentElement == "mntnInfodtlinfocont"{
            item?.mntnInfodtlinfocont = string
            
        }
        
//        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)//공백없에주기
//
//        xmlDictionary[currentElement] = data
        
    }
    
    // XML 파서가 종료 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        items?.append(item!)
  
    }
    
}

