//
//  StackViewExtensions.swift
//  Covid19Tracker
//
//  Created by Mark on 29/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
