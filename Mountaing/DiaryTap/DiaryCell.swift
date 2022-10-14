//
//  DiaryCell.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/14.
//

import UIKit
import FSCalendar

class DiaryCell : FSCalendarCell {
    
    
    override init!(frame: CGRect) {
        super.init(frame: frame)
        
        
        viewSetup()
        
        
        
        
        
    }
        required init!(coder aDecoder: NSCoder!) {
            fatalError("init(coder:) has not been implemented")
        }
    
  
    func viewSetup(){
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .clear
        self.backgroundView = view
        
        
        
    }
    
    
}
