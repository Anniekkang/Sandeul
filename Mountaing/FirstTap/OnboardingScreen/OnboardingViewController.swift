//
//  OnboardingViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/11.
//

import UIKit
import RealmSwift
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class OnboardingViewController: BaseViewController {
    
    let indicator = NVActivityIndicatorView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 550, width: 30, height: 30),
                                            type: .semiCircleSpin,
                                            color: colorCustom.shared.creamBackgroundColor,
                                            padding: 0)
    
    
    let localRealm = try! Realm()
    
    var tasks : Results<MountainModel>! {
        didSet {
            print("tasked changed!")
            
        }
    }
    var currentElement : String = ""
    var item : Item?
    var items : [Item] = []
    
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorCustom.shared.pinkColor
        configuration()
        view.addSubview(indicator)
       
       
    }
    
    
    
  
    
    override func configuration() {
        
        titleLabel.text = "WELCOME!"
        titleLabel.font = Font.customfirst.superbigLagefont
        titleLabel.textColor = colorCustom.shared.lightBlackColor
        titleLabel.textAlignment = .center
        
        startButton.setTitleColor(colorCustom.shared.pinkColor, for: .normal)
        startButton.setTitle("START", for: .normal)
        startButton.titleLabel?.font = Font.customfirst.extraLargefont
        startButton.backgroundColor = colorCustom.shared.lightBlackColor
        
    }
    
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
      
        print(#function)
      
        
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let vc =  sceneDelegate?.mainTabBar
        sceneDelegate!.window?.rootViewController = vc
       
       
       
       
    }
}
