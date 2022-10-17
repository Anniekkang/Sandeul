//
//  Function.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/14.
//

import UIKit
import SwiftUI

public func logoSetup() -> UIView {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    imageView.contentMode = .scaleAspectFit
    let image = UIImage(named: "logo")
    imageView.image = image
    
    return imageView
 
}

public func changeDate(pickerView : UIDatePicker, label : UILabel) {
   let dateformatter = DateFormatter()
    dateformatter.locale = Locale(identifier: "ko_KR")
    dateformatter.dateStyle = .long
    dateformatter.timeStyle = .none
    let date = dateformatter.string(from: pickerView.date)
    label.text = date
}

public func fromDatetoString(date : Date) -> String {
    let dateFormatter = DateFormatter()
    let selectdate = dateFormatter.string(from: date)
    return selectdate
    
}

