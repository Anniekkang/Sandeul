//
//  APIManager.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/19.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager {
    
    static let shared = APIManager()
    let url = URL(string: endPoint.Endpoint + APIKey.Encoding)
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        guard let data = data, error == nil else {
            print(error ?? "Unknown error")
            return
        }
        
        let parser = XMLParser(data: data)
        parser.delegate = self
        if parser.parse() {
            print(self.results ?? "No results")
        }
    }.resume()
   
 
}
