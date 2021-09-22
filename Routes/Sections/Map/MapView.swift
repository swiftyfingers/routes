//
//  MapView.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import UIKit
import MapKit

class MapView: UIView {
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MapView: MapPresentable {
    
    func setInitialRegion(_ region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: false)
    }
    
    func updateCenter(_ coordinate: CLLocationCoordinate2D) {
        mapView.setCenter(coordinate, animated: true)
    }
}
