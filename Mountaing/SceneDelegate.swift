//
//  SceneDelegate.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let Scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: Scene)
        
        let storyboard = UIStoryboard(name: "OnboardingScreen", bundle: nil)
        let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as UIViewController
        
        let mainVC = FirstViewController()
        let nav1 = UINavigationController(rootViewController: mainVC)
        let searchVC = SearchViewController()
        let nav2 = UINavigationController(rootViewController: searchVC)
//        let filterVC = FilterViewController()
//        let nav3 = UINavigationController(rootViewController: filterVC)
//        let diaryVC = DiaryViewController()
//        let nav4 = UINavigationController(rootViewController: diaryVC)
        
        let mainTabBar = UITabBarController()
        mainTabBar.setViewControllers([nav1,nav2], animated: true)
        
        if let items = mainTabBar.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].image = UIImage(systemName: "house")
            
            
            
            items[1].selectedImage = UIImage(systemName: "text.magnifyingglass")
            items[1].image = UIImage(systemName: "magnifyingglass")
            
            
//            items[2].selectedImage = UIImage(systemName: "line.3.horizontal.decrease.circle.fill")
//            items[2].image = UIImage(systemName: "line.3.horizontal.decrease.circle")
//            
            
//            items[2].selectedImage = UIImage(systemName: "book.fill")
//            items[2].image = UIImage(systemName: "book")
//
        }
       
        
        mainTabBar.tabBar.scalesLargeContentImage = true
        
        if Userdefaults.isFirstTime() {
            window?.rootViewController = onboardingVC
        } else {
            window?.rootViewController = mainTabBar
        }
       
        window?.makeKeyAndVisible()
        }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        // change the root view controller to your specific view controller
        window.rootViewController = vc
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

