//
//  MapSearchViewController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import UIKit

class MapSearchViewController: UIViewController {
    
    lazy var searchView: MapSearchView = {
        let view = MapSearchView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = searchView
    }
}
