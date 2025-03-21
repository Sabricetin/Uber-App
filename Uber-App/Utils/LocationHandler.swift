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
        locationManager.requestWhenInUseAuthorization() // İzin isteme
        locationManager.startUpdatingLocation()         // Konum güncellemesi
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            print("Konum izni rededildi")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let newLocation = locations.last else { return }
        self.location = newLocation // Son konumunu kaydet
    }
}
