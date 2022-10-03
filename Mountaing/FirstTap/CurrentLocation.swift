//
//  ConvertAddress.swift
//  Mountaing
//
//  Created by 나리강 on 2022/10/03.
//

import Foundation
import CoreLocation


extension FirstViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location: CLLocation = locationManger.location!
        let longitude: CLLocationDegrees = location.coordinate.longitude
        let latitude: CLLocationDegrees = location.coordinate.latitude
        
        
        
        let findLocation: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        let geoCoder: CLGeocoder = CLGeocoder()
        let local: Locale = Locale(identifier: "Ko-kr") // Korea
        geoCoder.reverseGeocodeLocation(findLocation, preferredLocale: local) { [self] placemarks, error in
            
            if let error = error {
                print(error)
            }
            
            guard let placemark = placemarks.self else { return }
            print(placemark)
            self.region = (placemark.first?.administrativeArea)!
            
            print("region=========\(region)")
            
            print(#function)
            
            
        }
    }




}
