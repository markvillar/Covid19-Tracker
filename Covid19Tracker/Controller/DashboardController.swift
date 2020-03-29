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
    let refreshControl = UIRefreshControl()
    
    override func loadView() {
        super.loadView()
        view = DashboardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRefreshControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        resetCounters()
    }
    
    fileprivate func setupRefreshControls() {
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetchin Data ...", attributes: nil)
        
        guard let dashboardView = view as? DashboardView else { return }
        dashboardView.scrollView.refreshControl = refreshControl
    }
    
    fileprivate func setupView() {
        navigationItem.title = "United Kingdom"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    fileprivate func resetCounters() {
        guard let dashboardView = view as? DashboardView else { return }
        
        dashboardView.confirmedLabel.text = "0"
        dashboardView.recoveredLabel.text = "0"
        dashboardView.deathsLabel.text = "0"
    }
    
    @objc func getData() {
        
        resetCounters()
        
        guard let dashboardView = view as? DashboardView else { return }
        
        let deadline = DispatchTime.now() + .milliseconds(500)
        
        network.getCases { [weak self] country in
            
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                dashboardView.confirmedLabel.countFromZero(to: Float(country.confirmed.value), duration: .brisk)
                dashboardView.recoveredLabel.countFromZero(to: Float(country.recovered.value), duration: .brisk)
                dashboardView.deathsLabel.countFromZero(to: Float(country.deaths.value), duration: .brisk)
                
                self?.refreshControl.endRefreshing()
            }
            
        }
        
    }


}

