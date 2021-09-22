//
//  ProfileNavigationController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import UIKit

class ProfileNavigation {
    
    private(set) var navigationController: UINavigationController
    
    private var profileViewController: ProfileViewController = {
        let vc = ProfileViewController()
        return vc
    }()
    
    init() {
        navigationController = UINavigationController(rootViewController: profileViewController)
    }
}
