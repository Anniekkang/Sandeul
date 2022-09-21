////
////  APIManager.swift
////  Mountaing
////
////  Created by 나리강 on 2022/09/21.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class APIManager {
//    static let shared = APIManager()
//    
//    private init(){}
//    
//    
//    func request(){
//        
//        AF.streamRequest(.xml)
//            .responseStream { stream in
//                switch stream.event {
//                case .complete:
//                    expect.fulfill()
//                default: break
//                }
//            }.asInputStream()
//        
//        waitForExpectations(timeout: timeout)
//        
//        // Then
//        let parser = XMLParser(stream: stream!)
//        let parsed = parser.parse()
//        XCTAssertTrue(parsed)
//        XCTAssertNil(parser.parserError)
//        
//    }
//}
