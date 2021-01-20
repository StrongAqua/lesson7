//
//  TabBarController.swift
//  iOSArchitecturesDemo
//
//  Created by aprirez on 1/17/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
       // debugPrint("Selected item")
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // debugPrint("Selected view controller")
    }

}
