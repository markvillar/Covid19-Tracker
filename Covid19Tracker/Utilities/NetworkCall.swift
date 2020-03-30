//
//  NetworkCall.swift
//  Covid19Tracker
//
//  Created by Mark on 27/03/2020.
//  Copyright © 2020 Mark Villar. All rights reserved.
//

import Foundation

class NetworkCall: NSObject {
    
    fileprivate static let session = URLSession(configuration: URLSessionConfiguration.default)
    
    static let shared = NetworkCall()
    
    func getCases(completion: @escaping (Country)->()) {
        
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .iso8601
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let url = "https://covid19.mathdro.id/api/countries/GB"
        
        let urlRequest = URL(string: url)
        
        NetworkCall.session.dataTask(with: urlRequest!) { data, response, error in
            
            guard error == nil else {
                print("There was an error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            // Check the response
            guard let data = data else { return }
            
            do {
                let country = try decoder.decode(Country.self, from: data)
                
                completion(country)
                
            } catch let jsonError {
                print("Failed to decode:", jsonError)
            }
            
        }.resume()
        
    }
    
}
