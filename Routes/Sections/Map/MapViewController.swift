//
//  MapViewController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import UIKit

class MapViewController: UIViewController {
    
    private lazy var mapView: MapView = {
        let view = MapView()
        return view
    }()
    
    override func loadView() {
        self.view = mapView
    }
}
