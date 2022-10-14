//
//  ConvertAddress.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/03.
//

import Foundation
import CoreLocation
import UIKit
import Toast

extension FirstViewController : CLLocationManagerDelegate {
    
    
    
    
    //called when location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location: CLLocation = locationManger.location!
        let longitude: CLLocationDegrees = location.coordinate.longitude
        let latitude: CLLocationDegrees = location.coordinate.latitude
        
        
        
        let findLocation: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        let geoCoder: CLGeocoder = CLGeocoder()
        let local: Locale = Locale(identifier: "Ko-kr") // Korea
        geoCoder.reverseGeocodeLocation(findLocation, preferredLocale: local) { placemarks, error in
            
            if let error = error {
                print(error)
            }
            
            guard let placemark = placemarks.self else { return }
            print(placemark)
            self.region = placemark.first?.locality ?? "서울"
            
            
            self.mainView.makeToast("'같은 지역에 있는 산'은 \n '서울특별시' 기준으로 보여집니다", duration: 1.5,
                                    point: CGPoint(x: self.mainView.center.x, y: 250),
                                   title: "위치를 찾을 수 없음",
                                   image: nil,
                                    style: self.toastStyle(),
                                   completion: nil)
            
            
            print("region=========\(self.region)")
            
            print(#function)
            
            
        }
        locationManger.stopUpdatingLocation()
    }

    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    
    func checkAuthorization() {
        let authorizationStatus : CLAuthorizationStatus = locationManger.authorizationStatus
        
        if CLLocationManager.locationServicesEnabled() {
            checkUserAuthorization(authorizationStatus)
        } else {
           print("위치서비스 꺼져있음")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkAuthorization()
        
    }

    
    func checkUserAuthorization (_ status : CLAuthorizationStatus){
        
        switch status {
        case .authorizedAlways :
            locationManger.stopUpdatingLocation()
            print("When In Use")
        case .denied, .restricted :
            print("아이폰 설정 유도")
            showRequestAlert()
        case .notDetermined :
            print("Not Determined")
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestWhenInUseAuthorization()
        default :
            print("nothing")
        }
        mainView.collectionView.reloadData()
    }
    
    func showRequestAlert(){
        
        let requestAlert = UIAlertController(title: "위치정보 이용", message: "'근처의 산' 서비스를 이용할 수 없습니다.기기의 '설정 > 개인정보보호'에서 위치서비스를 켜주세요 ", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _
            in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        
        let cancel = UIAlertAction(title: "서비스 이용 안함", style: .default) { _ in
           
            
            self.mainView.makeToast("'같은 지역에 있는 산'은 \n '서울특별시' 기준으로 보여집니다", duration: 1.5,
                                    point: CGPoint(x: self.mainView.center.x, y: 250),
                                   title: "위치서비스 거부",
                                   image: nil,
                                    style:  self.toastStyle(),
                                   completion: nil)
            
            
        }
        
        requestAlert.addAction(goSetting)
        requestAlert.addAction(cancel)
        
        present(requestAlert, animated: true)
        
        
    }

    func toastStyle() -> ToastStyle {
        var style = ToastStyle()
        style.backgroundColor = colorCustom.shared.greenColor
        style.messageColor = colorCustom.shared.creamBackgroundColor
        style.messageAlignment = .center
        style.titleAlignment = .center
        style.fadeDuration = 0.8
        return style
        
    }
    
}
