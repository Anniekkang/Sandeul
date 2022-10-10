//
//  OnboardViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/04.
//

import UIKit
import PaperOnboarding
import RealmSwift
import Alamofire
import SwiftyJSON

class OnboardViewController: UIViewController {

    @IBOutlet var startButton : UIButton!
    
    let localRealm = try! Realm()
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
            
        }
    }
    var currentElement : String = ""
    var item : Item?
    var items : [Item] = []
    
    
    let onboardInfos = [
        OnboardingItemInfo(informationImage: UIImage(named: "logo")!,
                           title: "WELCOME",
                           description: " 등산을 처음 시작하는 사람에게 \n최적의 도우미!",
                           pageIcon: UIImage(named: "logo2")!,
                           color: colorCustom.shared.creamBackgroundColor,
                           titleColor: colorCustom.shared.lightBlackColor,
                           descriptionColor: colorCustom.shared.greenColor,
                           titleFont: Font.customfirst.superbigLagefont,
                           descriptionFont: Font.customfirst.extraLargefont),
        
        OnboardingItemInfo(informationImage: UIImage(named: "mountain")!,
                           title: "등산은 마운팅과 함께",
                           description: "검색이 가능하여 손쉽게 산을 찾을 수 있는 \n접근성이 좋은 앱, 마운팅! ",
                           pageIcon: UIImage(systemName: "magnifyingglass")!,
                           color: colorCustom.shared.greenBackgroundColor,
                           titleColor: colorCustom.shared.lightBlackColor,
                           descriptionColor: colorCustom.shared.lightgreenColor,
                           titleFont: Font.customfirst.superbigLagefont,
                           descriptionFont: Font.customfirst.extraLargefont),
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.bringSubviewToFront(startButton)
        startButton.isHidden = true
        
        let onboarding = PaperOnboarding()
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
        
    }
    

    @IBAction func startButtontapped(_: UIButton) {
        let vc = FirstViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
