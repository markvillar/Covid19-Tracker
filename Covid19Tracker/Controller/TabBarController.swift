//
//  TabBarController.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        setUpViewControllers()
    }
    
    var homeScreenController: UINavigationController = {
        let dc = DashboardController()
        var hc = UINavigationController(rootViewController: dc)
        
        hc.tabBarItem.title = "Home"
        hc.tabBarItem.image = UIImage(systemName: "house.fill")
        return hc
    }()
    
    fileprivate func setUpTabBar() {
        tabBar.isTranslucent = true
        tabBar.isOpaque = true
    }
    
    //MARK: RootViewControllers
    fileprivate func setUpViewControllers() {
        
        let viewControllerList = [homeScreenController]
        
        setViewControllers(viewControllerList, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
