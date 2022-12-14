//
//  AppDelegate.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/13.
//

import UIKit
import RealmSwift
import FirebaseCore
import FirebaseMessaging

@main


class AppDelegate: UIResponder, UIApplicationDelegate {

   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        aboutRealmMigration()

        UIView.appearance().tintColor = colorCustom.shared.greenColor
        
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        //메세지 대리자 설정
        Messaging.messaging().delegate = self
        
       // 현재 등록된 토큰 가져오기
        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          } else if let token = token {
            print("FCM registration token: \(token)")

          }
        }

        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("SchemaVersion:\(version)")
        } catch {
            print(error)
        }

        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func aboutRealmMigration(){
        
        let config = Realm.Configuration(schemaVersion: 2) { migration, oldSchemaVersion in
            
            if oldSchemaVersion < 1 {
                
            }
            if oldSchemaVersion < 2 {
                migration.enumerateObjects(ofType: MountainModel.className()) { oldObject, newObject in
                    guard let new = newObject else { return }
                    guard let old = oldObject else { return }
                    
                    new["altitude"] = old["altitude"]
                }
            }
        }
        
        
        Realm.Configuration.defaultConfiguration =  config
        
        
        
    }
  
 
}

extension AppDelegate : MessagingDelegate {
    
    //토큰 갱신 모니터링 : 토큰 정보가 언제 바뀔까?(옵션 설정)(클릭했을 때만 진행됨)
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }

    
    
}

extension AppDelegate : UNUserNotificationCenterDelegate {
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
    }
    
    //foreground에서 알림 수신 : 푸시마다 설정 or 화면마다 설정
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //home화면에 있을 때 포그라운드 푸시 띄우지 마라
        guard let viewController = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController?.topViewController else { return }
        
        if viewController is FirstViewController {
            completionHandler([])
        } else {
            completionHandler([.badge,.banner,.list,.sound])
        }
    }
    
    //유져가 푸시를 클릭했을 때만 수신 확인 가능 (특정 푸시를 클릭하면 특정 상세화면으로 화면전환)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("User clicked push")
        
        print(response.notification.request.content.body)
        print(response.notification.request.content.userInfo)
        
//        let userInfo = response.notification.request.content.userInfo
//
//        if userInfo[AnyHashable]
//
        
        guard let viewController = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController?.topViewController else { return }
        
        print(viewController)
        
        if viewController is SearchViewController {
            viewController.navigationController?.pushViewController(FirstViewController(), animated: true)
        }
        
//        if viewController is DiaryViewController {
//            viewController.navigationController?.pushViewController(FirstViewController(), animated: true)
//        }
        
        
    }
    
    
    
    
}
