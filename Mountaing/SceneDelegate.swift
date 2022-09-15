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
        
        let mainVC = HomeViewController()
        let nav1 = UINavigationController(rootViewController: mainVC)
        let searchVC = SearchViewController()
        let nav2 = UINavigationController(rootViewController: searchVC)
        let filterVC = FilterViewController()
        let nav3 = UINavigationController(rootViewController: filterVC)
        let diaryVC = DiaryViewController()
        let nav4 = UINavigationController(rootViewController: diaryVC)
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([nav1,nav2,nav3,nav4], animated: true)
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].image = UIImage(systemName: "house")
            
            
            
            items[1].selectedImage = UIImage(systemName: "magnifyingglass.circle")
            items[1].image = UIImage(systemName: "magnifyingglass")
            
            
            items[2].selectedImage = UIImage(systemName: "line.3.horizontal.decrease.circle.fill")
            items[2].image = UIImage(systemName: "line.3.horizontal.decrease.circle")
            
            
            items[3].selectedImage = UIImage(systemName: "book.fill")
            items[3].image = UIImage(systemName: "book")
            
        }
       
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.scalesLargeContentImage = true
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
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

