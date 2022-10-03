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
    //동기화 함수로 만들기
    func convertAddress(){
        print(#function)
        let currentLocation : CLLocation = locationManger.location ?? CLLocation()
        let locale = Locale(identifier: "Ko-kr")
        print("before")
        
        self.geocorder.reverseGeocodeLocation(currentLocation, preferredLocale: locale) { placemarks, error in
            
            if let error = error {
                print(error)
            }
            
            guard let placemark = placemarks.self else { return }
            print(placemark)
            
           DispatchQueue.main.async {
                print("dispatchQueue")
                guard let region = placemark.first?.administrativeArea else { return }
                print("region=========\(region)")
                
                self.regionFiltered = self.tasks.filter("location contains '\(region)'").map { $0 }
                
                print("regionFiltered:\(self.regionFiltered)")
                MountainModel.model = self.regionFiltered.randomElement() ?? MountainModel()
           }
            
            
            
        }
        
        
    }
    
}
