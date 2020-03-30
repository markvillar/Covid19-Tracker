//
//  DashboardView.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

class DashboardView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.bounces = true
        //scrollView.alwaysBounceVertical = true
        //scrollView.isScrollEnabled = true
        //scrollView.showsVerticalScrollIndicator = true
        //scrollView.autoresizingMask = .flexibleHeight
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let confirmedTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .systemYellow
        textLabel.text = "Confirmed Cases"
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return textLabel
    }()
    
    let confirmedLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .systemYellow
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let recoveredTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .systemGreen
        textLabel.text = "Recovered"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let recoveredLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .systemGreen
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let deathsTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .systemRed
        textLabel.text = "Deaths"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let deathsLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .systemRed
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    var lastUpdatedAtLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .black
        textLabel.text = "Last Updated: Never"
        textLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func wrapInStackView(labels:UILabel..., colour:UIColor? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if colour != nil {
            stackView.addBackground(color: colour!)
        }
        
        for label in labels {
            stackView.addArrangedSubview(label)
        }
        
        return stackView
    }
    
    fileprivate func setupScrollView() {
        
        addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height)
        
        scrollView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    fileprivate func setupView() {
        
        backgroundColor = .systemBackground
        
        setupScrollView()
        
        scrollView.addSubview(mainStackView)
        
        
        let extraLongView = UIView()
        
        extraLongView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            extraLongView.heightAnchor.constraint(equalToConstant: 200),
            extraLongView.widthAnchor.constraint(equalToConstant: frame.width)
        ])


        //Create all labels
        let confirmedCases = wrapInStackView(labels: confirmedTextLabel, confirmedLabel)
        let recoveredCases = wrapInStackView(labels: recoveredTextLabel, recoveredLabel)
        let deathCases = wrapInStackView(labels: deathsTextLabel, deathsLabel)
        let updatedAt = wrapInStackView(labels: lastUpdatedAtLabel)
        let subViews = [confirmedCases, recoveredCases, deathCases, updatedAt]

        for subView in subViews {
            mainStackView.addArrangedSubview(subView)
        }
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
    }
    
    
}
