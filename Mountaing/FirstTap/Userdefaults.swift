//
//  Userdefaults.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/11.
//

import Foundation

public class Userdefaults {
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey: "isFirstTime")
            return true
        } else  {
            return false
        }
    }
}
