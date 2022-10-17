//
//  DetailViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/14.
//

import UIKit
import SwiftUI


class DetailViewController: BaseViewController {
    
    
    var mainView = DetailView()
    override func loadView() {
        self.view = mainView
        print(#function)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = colorCustom.shared.whiteBackgroundColor
     
        
        let picker = UIDatePicker()
        picker.backgroundColor = colorCustom.shared.greenColor.withAlphaComponent(0.5)
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_KR")
        picker.preferredDatePickerStyle = .automatic
        
        
        
        
        
    }
    
    
}













