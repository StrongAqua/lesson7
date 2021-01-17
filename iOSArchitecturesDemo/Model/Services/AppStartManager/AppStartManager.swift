//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        let rootVC = TabBarController()
        
        let searchAppImage = UIImage(named: "search_app")?.resized(to: CGSize(width: 30, height: 30))
        let appsTabBarItem = UITabBarItem(
            title: "",
            image: searchAppImage,
            tag: 0
        )
        let appsVC = SearchBuilder.buildAppsSearch()
        appsVC.tabBarItem = appsTabBarItem
        appsVC.navigationItem.title = "Search Apps"
        
        let songsAppImage = UIImage(named: "search_song")?.resized(to: CGSize(width: 30, height: 30))
        let songsTabBarItem = UITabBarItem(
            title: "",
            image: songsAppImage,
            tag: 1
        )
        let songsVC = SearchBuilder.buildSongsSearch()
        songsVC.tabBarItem = songsTabBarItem
        songsVC.navigationItem.title = "Search Songs"
        
        rootVC.viewControllers = [appsVC, songsVC].map { createNavController(rootViewController: $0) }
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
    }
    
    private func createNavController(rootViewController: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootViewController)
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }
}
