//
//  APIKey.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/15.
//

import UIKit

enum APIKey {
    static let Encoding = "UozP%2BZQ4xoM8y%2BlgzHPeybgkNHyl7M2R4hDsfabLGBzWNduklkOrYuNUH0Qp%2Fb%2F1AJyoiCfwCJcDYeiGLM4OJQ%3D%3D"
    
} 

enum endPoint {
    static let first = "http://api.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice?serviceKey="
    static let second = "http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI?serviceKey=\(APIKey.Encoding)&searchMtNm=%EA%B0%80&searchArNm=%EA%B0%95%EC%9B%90&pageNo=1&startPage=1&numOfRows=10&pageSize=10"
}
