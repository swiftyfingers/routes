//
//  ProfileViewController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = profileView
        self.navigationItem.title = "Profile"
    }
}
