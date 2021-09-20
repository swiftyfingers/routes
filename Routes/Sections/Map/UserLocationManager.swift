//
//  UserLocationManager.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import Foundation
import CoreLocation

protocol UserLocationManagerDelegate: AnyObject {
    func didUpdateLocation(_ location: CLLocation)
}

class UserLocationManager: NSObject, CLLocationManagerDelegate {
    
    weak var delegate: UserLocationManagerDelegate?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else { return }
        delegate?.didUpdateLocation(currentLocation)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if isAuthorized(manager.authorizationStatus) {
            manager.startUpdatingLocation()
        } else {
            return // Notify the user that the app is unavailable.
        }
    }
    
    // MARK: Helpers
    
    func isAuthorized(_ status: CLAuthorizationStatus) -> Bool {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        case .denied, .restricted, .notDetermined:
            return false
        @unknown default:
            return false
        }
    }
}
