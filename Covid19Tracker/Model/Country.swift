//
//  Country.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import Foundation

struct Country: Decodable {
    
    let confirmed: Summary
    let recovered: Summary
    let deaths: Summary
    let lastUpdate: String
    
}
