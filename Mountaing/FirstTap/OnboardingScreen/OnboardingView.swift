//
//  PopupView.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/04.
//

import UIKit
import PaperOnboarding

extension OnboardViewController : PaperOnboardingDelegate {
    
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        item.titleCenterConstraint?.constant = 100
        item.descriptionCenterConstraint?.constant = 100

        // configure item
        
        item.titleLabel?.backgroundColor = colorCustom.shared.creamBackgroundColor
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = .
    }
}

extension OnboardViewController : PaperOnboardingDataSource {

    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return onboardInfos[index]
    }

    func onboardingItemsCount() -> Int {
        return 2
    }
    
        func onboardinPageItemRadius() -> CGFloat {
            return 2
        }
    //
        func onboardingPageItemSelectedRadius() -> CGFloat {
            return 10
        }
    //    func onboardingPageItemColor(at index: Int) -> UIColor {
    //        return [UIColor.white, UIColor.red, UIColor.green][index]
    //    }
}






