//
//  FontCustom.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/18.
//

import UIKit

enum FontSize : CGFloat {
    case small = 12
    case medium = 16
    case large  = 20
    case extraLarge = 25
}

enum Font : Int {
    case customfirst

    var smallFont : UIFont {
        switch self {
        case .customfirst :
            return UIFont(name: "ROKAF-Sans-Medium", size: FontSize.small.rawValue)!

        }
        
    }
    
    var mediumFont : UIFont {
        switch self {
        case .customfirst :
            return UIFont(name: "ROKAF-Sans-Medium", size: FontSize.medium.rawValue)!
        }
    }
    
    var largeFont : UIFont {
        switch self {
        case .customfirst :
            return UIFont(name: "ROKAF-Sans-Medium", size: FontSize.large.rawValue)!
        }
    }
    
    var extraLargefont : UIFont {
        switch self {
        case .customfirst :
            return UIFont(name: "ROKAF-Sans-Medium", size: FontSize.extraLarge.rawValue)!
        }
    }
}


let fontKey = "Font"

class FontManager {

    /// 저장된 폰트 가져오기
       static func getFont() -> Font {
           if let font = (UserDefaults.standard.value(forKey: fontKey) as AnyObject).integerValue {
               return Font(rawValue: font)!
           } else {
               // 저장된 폰트가 없으면 기본 폰트로
               return .customfirst
           }
       }
       /// 폰트 저장하기
       static func setFont(font: Font) {
           UserDefaults.standard.setValue(font.rawValue, forKey: fontKey)
           UserDefaults.standard.synchronize()
       }
}

