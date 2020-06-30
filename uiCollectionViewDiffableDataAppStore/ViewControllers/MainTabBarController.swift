//
//  MainTabBarController.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/29/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    public lazy var appsViewController: AppsViewController = {
        let vc = AppsViewController()
        vc.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "square.stack.3d.up"), selectedImage: UIImage(systemName: "square.stack.3d.up.fill"))
        return vc
    }()
    
    public lazy var arcadeViewController: ArcadeViewController = {
        let vc = ArcadeViewController()
        vc.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "sparkles"), selectedImage: UIImage(systemName: "sparkles"))
        return vc
    }()
    
    public lazy var gamesViewController: GamesViewController = {
        let vc = GamesViewController()
        vc.tabBarItem = UITabBarItem(title: "Games", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))
        return vc
    }()
    public lazy var searchViewController: SearchViewController = {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .blue
        viewControllers = [UINavigationController(rootViewController: appsViewController), UINavigationController(rootViewController: arcadeViewController),  UINavigationController(rootViewController: gamesViewController),UINavigationController(rootViewController: searchViewController)]
        
    }
    
}
