//
//  LocationHandler.swift
//  Uber-App
//
//  Created by Sabri Çetin on 21.03.2025.
//

import Foundation
import CoreLocation


class LocationHandler : NSObject , CLLocationManagerDelegate {
    
    
    static let shared = LocationHandler()
    var locationManager : CLLocationManager!
    var location : CLLocation!
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
}
