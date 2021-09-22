//
//  MapSearchView.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import UIKit

class MapSearchView: UIView {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
