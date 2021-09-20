//
//  MapPresenter.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import Foundation
import CoreLocation
import MapKit

protocol MapPresenterDelegate: AnyObject {
}

protocol MapPresentable: AnyObject {
    func setInitialRegion(_ region: MKCoordinateRegion)
    func updateCenter(_ coordinate: CLLocationCoordinate2D)
}

class MapPresenter {
    
    weak var delegate: MapPresenterDelegate?
    weak var presentable: MapPresentable?
    
    private var userLocation: CLLocation?
    
    private lazy var userLocationManagerDelegate: UserLocationManager = {
        let userLocationManager = UserLocationManager()
        userLocationManager.delegate = self
        return userLocationManager
    }()
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = userLocationManagerDelegate
        return locationManager
    }()
    
    // MARK: Public Methods
    
    public func setup() {
        locationManager.requestAlwaysAuthorization()
    }
}

extension MapPresenter: UserLocationManagerDelegate {
    
    func didUpdateLocation(_ location: CLLocation) {
        if userLocation == nil {
            self.userLocation = location
            let region = MKCoordinateRegion(center: location.coordinate,
                                            latitudinalMeters: 750,
                                            longitudinalMeters: 750)
            presentable?.setInitialRegion(region)
        } else {
            presentable?.updateCenter(location.coordinate)
        }
    }
}
