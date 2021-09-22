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
    
    lazy var searchContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        [mapView, searchContainerView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchContainerView.topAnchor.constraint(equalTo: topAnchor),
            searchContainerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension MapView: MapPresentable {
    
    func didUpdateViewModel(_ mapViewModel: MapViewModel?) {
        guard let coordinate = mapViewModel?.userLocation?.coordinate else { return }
        
        if let span = mapViewModel?.span {
            let region = MKCoordinateRegion(center: coordinate,
                                            span: span)
            mapView.setRegion(region, animated: false)
        } else {
            mapView.setCenter(coordinate, animated: false)
        }
    }
}
