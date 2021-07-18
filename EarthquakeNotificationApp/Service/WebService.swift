//
//  WebService.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 11.07.2021.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping (EarthquakeCurrency?, String?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error.localizedDescription)
            } else if let data = data {
                
                
                let earthquakeList = try? JSONDecoder().decode(EarthquakeCurrency.self, from: data)
                
                if let earthquakeList = earthquakeList {
                    completion(earthquakeList, nil)
                }
                
            }
            
        }.resume()
        
    }
    
}
