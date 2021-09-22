//
//  HomeNavigationController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import Foundation
import UIKit

class HomeNavigation {
    
    private(set) var navigationController: UINavigationController
    
    private var mapViewController: MapViewController = {
        let vc = MapViewController()
        return vc
    }()
    
    init() {
        navigationController = UINavigationController(rootViewController: mapViewController)
    }
}
