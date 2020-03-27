//
//  DashboardController.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {
    
    let network = NetworkCall()
    
    override func loadView() {
        super.loadView()
        view = DashboardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        navigationItem.title = "Covid-19 Global Summary"
        
        guard let dashboardView = view as? DashboardView else { return }
        
        network.getCases { country in
            
            DispatchQueue.main.async {
                dashboardView.confirmedLabel.countFromZero(to: Float(country.confirmed.value), duration: .strolling)
                dashboardView.recoveredLabel.countFromZero(to: Float(country.recovered.value), duration: .brisk)
                dashboardView.deathsLabel.countFromZero(to: Float(country.deaths.value), duration: .brisk)
            }
            
        }
        
    }


}

