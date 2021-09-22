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
    
    // MARK: Child View Controllers
    
    private lazy var searchViewController: MapSearchViewController = {
        let vc = MapSearchViewController()
        return vc
    }()
    
    // MARK: Life Cycle
    
    override func loadView() {
        super.loadView()
        self.view = mapView
        self.navigationItem.title = "Routes"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: Helpers
    
    private func setup() {
        addSearchViewController()
        mapPresenter.setup()
    }
    
    private func addSearchViewController() {
        searchViewController.willMove(toParent: self)
        addChild(searchViewController)
        mapView.searchContainerView.addSubview(searchViewController.view)
        
        searchViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchViewController.view.topAnchor.constraint(equalTo: mapView.searchContainerView.topAnchor),
            searchViewController.view.bottomAnchor.constraint(equalTo: mapView.searchContainerView.bottomAnchor),
            searchViewController.view.trailingAnchor.constraint(equalTo: mapView.searchContainerView.trailingAnchor),
            searchViewController.view.leadingAnchor.constraint(equalTo: mapView.searchContainerView.leadingAnchor)
        ])
        
        searchViewController.didMove(toParent: self)
    }
}

extension MapViewController: MapPresenterDelegate { }
