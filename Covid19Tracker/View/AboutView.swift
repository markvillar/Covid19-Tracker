//
//  AboutView.swift
//  Covid19Tracker
//
//  Created by Mark on 30/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        //stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
    
    let developerEmail: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "mark@markvillar.com"
        textLabel.font = UIFont.boldSystemFont(ofSize: 18)
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
        
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(developerName)
        stackView.addArrangedSubview(developerEmail)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
        
        
    }
    
}
