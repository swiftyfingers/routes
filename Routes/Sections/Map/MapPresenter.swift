//
//  MapPresenter.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import Foundation
import CoreLocation
import MapKit

protocol MapPresenterDelegate: AnyObject { }

protocol MapPresentable: AnyObject {
    func didUpdateViewModel(_ mapViewModel: MapViewModel?)
}

class MapPresenter {
    
    weak var delegate: MapPresenterDelegate?
    weak var presentable: MapPresentable?
    
    private var mapViewModel: MapViewModel? {
        didSet {
            presentable?.didUpdateViewModel(mapViewModel)
        }
    }
    
    private lazy var userLocationManagerDelegate: UserLocationManager = {
        let userLocationManager = UserLocationManager()
        userLocationManager.delegate = self
        return userLocationManager
    }()
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = userLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Default value.
        return locationManager
    }()
    
    // MARK: Public Methods
    
    public func setup() {
        locationManager.requestAlwaysAuthorization()
    }
}

extension MapPresenter: UserLocationManagerDelegate {
    
    func didUpdateLocation(_ location: CLLocation) {
        if mapViewModel?.userLocation == nil {
            let initialSpan = MKCoordinateSpan(latitudeDelta: 0.03,
                                               longitudeDelta: 0.03)
            mapViewModel = MapViewModel(span: initialSpan,
                                        userLocation: location)
        } else {
            mapViewModel = MapViewModel(span: nil,
                                        userLocation: location)
        }
    }
}
