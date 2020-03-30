//
//  AboutView.swift
//  Covid19Tracker
//
//  Created by Mark on 30/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    let name: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Covid19Tracker"
        textLabel.font = UIFont.boldSystemFont(ofSize: 35)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let developerName: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Mark Villar"
        textLabel.font = UIFont.boldSystemFont(ofSize: 25)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        
        backgroundColor = .systemBackground
        
        addSubview(name)
        addSubview(developerName)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            developerName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            developerName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        
    }
    
}
