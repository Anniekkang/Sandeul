//
//  ConvertLocation.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/01.
//

import CoreLocation

extension FirstViewController: CLLocationManagerDelegate {
    
    
    // 위치 정보 계속 업데이트 -> 위도 경도 받아옴
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("didUpdateLocations")
//        guard let location = locations.first  else { return }
//        print("위도: \(location.coordinate.latitude)")
//        print("경도: \(location.coordinate.longitude)")
//     
//        
//    }
    func convertAddress(){
        
        let currentLocation : CLLocation = locationManger.location!
        let locale = Locale(identifier: "Ko-kr")
        geocorder = CLGeocoder()
        
        geocorder.reverseGeocodeLocation(currentLocation, preferredLocale: locale) { placemarks, error in
            
            
            if let error = error {
                print(error)
            }
            
            // 2
            guard let placemark = placemarks.self else { return }
            print(placemark)
            
            DispatchQueue.main.async {
                
                guard let region = placemark.first?.administrativeArea else { return }
                print("region=========\(region)")
                        
            }
            
            
        }
        
        
    }

}
