////
////  APIManager.swift
////  Mountaing
////
////  Created by 나리강 on 2022/09/15.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//
//extension SearchViewController : XMLParserDelegate {
//    
//
//    
//    enum XMLKey: String {
//        case mntninfopoflc = "mntninfopoflc"
//        case mntnnm = "mntnnm"
//        case mntninfohght = "mntninfohght"
//        case mntnInfodtlinfocont = "mntnInfodtlinfocont"
//        case mntnattchimageseq = "mntnattchimageseq"
//    }
//    
//    
//    
//    
//    func setParser(from url: URL) {
//        let parser = XMLParser(contentsOf: url)
//        parser!.delegate = self
//        if parser!.parse() {
//            
//            print("parsing succeed")
//            
//        } else {
//            print("parsing error")
//        }
//        
//    }
//    
//    // XML 파싱을 시작하는 태그에서 이벤트 핸들링
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String] = [:]) {
//        
//        if elementName == "item" {
//            xmlDictionary = [:]
//        } else if elementName == "mntninfopoflc" {
//            elementType = .mntninfopoflc
//        } else if elementName == "mntnnm" {
//            elementType = .mntnnm
//        } else if elementName == "mntninfohght"{
//            elementType = .mntninfohght
//        } else if elementName == "mntnattchimageseq"{
//            elementType = .mntnattchimageseq
//        } else if elementName == "mntnInfodtlinfocont"{
//            elementType = .mntnInfodtlinfocont
//            
//        }
//    }
//    // 태그의 Data가 string으로 들어옴
//        func parser(_ parser: XMLParser, foundCharacters string: String) {
//            
//            guard xmlDictionary != nil,
//            let elementType = self.elementType else { return }
//            xmlDictionary.updateValue(string, forKey: elementType.rawValue)
//           print(xmlDictionary)
//        }
//    
//    
//    // XML 파싱이 끝나는 태그에서 이벤트 핸들링
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        
//        
//        guard let xmlDictionary = self.xmlDictionary else { return }
//        
//        if elementName == "item" {
//            var currentItem = item()
//            
//            let mntninfohght = xmlDictionary[XMLKey.mntninfohght.rawValue]
//            let mntnInfodtlinfocont = xmlDictionary[XMLKey.mntnInfodtlinfocont.rawValue]
//                  let mntnattchimageseq = xmlDictionary[XMLKey.mntnattchimageseq.rawValue]
//                  let mntnnm = xmlDictionary[XMLKey.mntnnm.rawValue] 
//                 let mntninfopoflc = xmlDictionary[XMLKey.mntninfopoflc.rawValue]
//            
//            
//            currentItem.mntninfohght = mntninfohght
//            currentItem.mntnattchimageseq = mntnattchimageseq
//            currentItem.mntnInfodtlinfocont = mntnInfodtlinfocont
//            currentItem.mntnnm = mntnnm
//            currentItem.mntninfopoflc = mntninfopoflc
//            
//            
//            items?.append(currentItem)
//           
//            print("10)")
//            print("=========\(items)")
//            
//        }
//        
//        //elementType = nil
//    }
//    
//    
//    
//    
//}
//
//
