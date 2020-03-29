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
    
    let scrollViewContentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
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
        textLabel.textColor = .orange
        textLabel.text = "Confirmed Cases"
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return textLabel
    }()
    
    let confirmedLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .orange
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let recoveredTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .green
        textLabel.text = "Recovered"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let recoveredLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .green
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let deathsTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .red
        textLabel.text = "Deaths"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    let deathsLabel: AnimatedLabel = {
        let textLabel = AnimatedLabel()
        textLabel.textColor = .red
        textLabel.text = "0"
        textLabel.font = UIFont.boldSystemFont(ofSize: 60)
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func wrapInStackView(labels:UILabel..., colour:UIColor) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.addBackground(color: colour)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.addSubview(mainStackView)

        //Create all labels
        let confirmedCases = wrapInStackView(labels: confirmedTextLabel, confirmedLabel, colour: .yellow)
        let recoveredCases = wrapInStackView(labels: recoveredTextLabel, recoveredLabel, colour: .systemGreen)
        let deathCases = wrapInStackView(labels: deathsTextLabel, deathsLabel, colour: .systemRed)
        let subViews = [confirmedCases, recoveredCases, deathCases]

        for subView in subViews {
            mainStackView.addArrangedSubview(subView)
        }

        NSLayoutConstraint.activate([
            scrollViewContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            //scrollViewContentView.widthAnchor.constraint(equalToConstant: frame.width),
            scrollViewContentView.heightAnchor.constraint(greaterThanOrEqualToConstant: frame.height)
        ])

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor, constant: 30),
            //mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            //mainStackView.widthAnchor.constraint(equalToConstant: frame.width),
            //mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        
    }
    
    
}
