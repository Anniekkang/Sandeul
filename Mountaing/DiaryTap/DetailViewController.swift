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
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = colorCustom.shared.creamBackgroundColor
        
        
    }
    
    
    
    
    
    
  
}
