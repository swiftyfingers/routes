//
//  MapViewController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-20.
//

import UIKit

class MapViewController: UIViewController {
    
    private lazy var mapPresenter: MapPresenter = {
        let presenter = MapPresenter()
        presenter.delegate = self
        presenter.presentable = mapView
        return presenter
    }()
    
    private lazy var mapView: MapView = {
        let view = MapView()
        return view
    }()
    
    // MARK: Life Cycle
    
    override func loadView() {
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapPresenter.setup()
    }
}

extension MapViewController: MapPresenterDelegate {
}
