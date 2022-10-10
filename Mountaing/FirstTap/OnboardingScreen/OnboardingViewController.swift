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

class OnboardingViewController: BaseViewController {
    
    
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
