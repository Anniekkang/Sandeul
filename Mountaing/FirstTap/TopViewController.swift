//
//  TopViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/13.
//

import Foundation
import UIKit


extension UIViewController {
    
    var topViewController : UIViewController {
        return self.topViewController(currentVC: self)
   
    }
    
            func topViewController(currentVC : UIViewController) -> UIViewController {
                if let tabBarController = currentVC as? UITabBarController,
                   let selectedViewController = tabBarController.selectedViewController  {
                    return self.topViewController(currentVC: selectedViewController)
                } else if let navigationController = currentVC as? UINavigationController,
                          let visibleViewController = navigationController.visibleViewController {
                    return self.topViewController(currentVC: visibleViewController)
                } else if let presentedViewController = currentVC.presentedViewController {
                    return self.topViewController(currentVC: presentedViewController)
                } else  {
                    return currentVC
                }
            }
    
    
}
