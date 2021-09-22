//
//  RoutesTabBarController.swift
//  Routes
//
//  Created by Rikard Platus on 2021-09-22.
//

import UIKit

class RoutesTabBarController: UITabBarController {
    
    enum RoutesTabBarItemType: Int {
        case home = 0
        case profile = 1
    }
    
    private var tabBarItems: [RoutesTabBarItemType] = [.home,
                                                       .profile]
    
    // MARK: Tabs
    
    private lazy var homeNavigation: HomeNavigation = {
        let homeNavigationController = HomeNavigation()
        return homeNavigationController
    }()
    
    private lazy var profileNavigation: ProfileNavigation = {
        let navigationController = ProfileNavigation()
        return navigationController
    }()
    
    // MARK: Public Methods
    
    public func setup() {
        
        var viewControllers: [UIViewController] = []
        
        tabBarItems.forEach {
            switch $0 {
            case .home:
                viewControllers.append(homeNavigation.navigationController)
            case .profile:
                viewControllers.append(profileNavigation.navigationController)
            }
        }
        
        self.viewControllers = viewControllers
        
        self.viewControllers?.forEach {
            guard let currentIndex = self.viewControllers?.firstIndex(of: $0),
                  let tabBarItemType = RoutesTabBarItemType(rawValue: currentIndex) else { return }
            
            switch tabBarItemType {
            case .home:
                $0.tabBarItem.title = "Home"
            case .profile:
                $0.tabBarItem.title = "Profile"
            }
        }
    }
}
