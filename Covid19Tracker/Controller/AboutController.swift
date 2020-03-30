//
//  AboutController.swift
//  Covid19Tracker
//
//  Created by Mark on 30/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class AboutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        view = AboutView()
    }
    
    fileprivate func setupView() {
        navigationItem.title = "About"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
