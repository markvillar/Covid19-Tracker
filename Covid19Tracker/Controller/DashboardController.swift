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
                dashboardView.confirmedLabel.text = "\(country.confirmed.value)"
                dashboardView.recoveredLabel.text = "\(country.recovered.value)"
                dashboardView.deathsLabel.text = "\(country.deaths.value)"
            }
            
        }
        
    }


}

