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
        var nc = UINavigationController(rootViewController: dc)
        
        nc.tabBarItem.title = "Home"
        nc.tabBarItem.image = UIImage(systemName: "house")
        nc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        return nc
    }()
    
    var aboutScreenController: UINavigationController = {
        let dc = AboutController()
        var nc = UINavigationController(rootViewController: dc)
        
        nc.tabBarItem.title = "About"
        nc.tabBarItem.image = UIImage(systemName: "person")
        nc.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        return nc
    }()
    
    fileprivate func setUpTabBar() {
        tabBar.isTranslucent = true
        tabBar.isOpaque = true
    }
    
    //MARK: RootViewControllers
    fileprivate func setUpViewControllers() {
        
        let viewControllerList = [homeScreenController, aboutScreenController]
        
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
