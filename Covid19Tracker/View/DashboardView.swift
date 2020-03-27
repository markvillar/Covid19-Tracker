//
//  DashboardView.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class DashboardView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let confirmedLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .orange
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return textLabel
    }()
    
    let recoveredLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .green
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return textLabel
    }()
    
    let deathsLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .red
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
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
        addSubview(stackView)
        
        let subViews = [confirmedLabel, recoveredLabel, deathsLabel]
        
        for subView in subViews {
            stackView.addArrangedSubview(subView)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    
}
