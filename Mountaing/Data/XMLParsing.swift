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
    
    
    // XML 파서가 시작 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if elementName == "item" {
            item = Item()
        }

    }
    
    
    // 현재 테그에 담겨있는 문자열 전달
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
        
    
    }
    
    // XML 파서가 종료 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        
        if elementName == "item" {
            
            items.append(item!)
        
        }
       
  
    }
    
}

