//
//  HomeTabBarController.swift
//  TBCInsurance
//
//  Created by Ilia Khaburdzania on 5/8/20.
//  Copyright © 2020 Ilia Khaburdzania. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        self.tabBar.tintColor = #colorLiteral(red: 0.4392156863, green: 0.3882352941, blue: 0.9176470588, alpha: 1)
        setupTabItems()
    }
    
    
    func setupTabItems() {
        let tabItems = [
            (AppModules.main,#imageLiteral(resourceName: "home_icon"),"TODAY"),
            (AppModules.forecast,#imageLiteral(resourceName: "calendar-icon"),"FORECAST")
        ]
        let viewcontrollers = tabItems.map {
            getTabBarItem($0.0, $0.1, $0.2)
        }
        self.setViewControllers(viewcontrollers, animated: false)
    }
    
    func getTabBarItem(_ moduleType: AppModules,_ image: UIImage,_ title: String) -> UINavigationController {
        let module = moduleType.build()
        let vc = module.view as! UIViewController
        let nc = ProgressNavigationController(rootViewController: vc)
        nc.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeueLTGEO-75Bold", size: 27)!]
        vc.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        return nc
    }
}

