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
        setupBarButton()
        getData()
    }
    
    @objc func fakefunc() {
        print("Change Country")
    }
    
    fileprivate func setupBarButton() {
        let changeCountry = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(fakefunc))
        navigationItem.rightBarButtonItem = changeCountry
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
    
    fileprivate func getTime(isoDate: String) -> String {
        let formattGet = DateFormatter()
        formattGet.locale = Locale(identifier: "en_US_POSIX")
        formattGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let localFormatter = DateFormatter()
        localFormatter.locale = Locale.current
        localFormatter.dateFormat = "EEEE, d MMM yyyy HH:mm:ss"
        
        if let dateObject = formattGet.date(from: isoDate) {
            let dateObjectFinalForm = localFormatter.string(from: dateObject)
            return dateObjectFinalForm
        } else {
            return "Unknown"
        }
        
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
                
                guard let updatedTime = self?.getTime(isoDate: country.lastUpdate) else {
                    dashboardView.lastUpdatedAtLabel.text = "Last Updated: Unknown"
                    return
                }
                
                dashboardView.lastUpdatedAtLabel.text = "Last Updated: \(String(describing: updatedTime))"
                
                self?.refreshControl.endRefreshing()
            }
            
        }
        
    }


}

