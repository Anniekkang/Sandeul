//
//  FilterViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit

class FilterViewController: BaseViewController {

    var mainView = FilterView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        
    }
    

    

}
