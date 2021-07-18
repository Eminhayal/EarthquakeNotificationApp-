//
//  EarthquakeViewModel.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 11.07.2021.
//


import Foundation


class EarthquakeListViewModel {
    var earthquakeCurrencyList: EarthquakeCurrency?
    var tempCurrentList: EarthquakeCurrency?
    var reloadTableView:(() -> Void )?
    var alertError: ((String) -> ())?
    
    func numberOfRowsInSection() -> Int {
        return self.earthquakeCurrencyList?.data.count ?? 0
    }
    func earthqueakeAtIndex(_ index: Int) -> Earthquake {
        let earthquake = self.tempCurrentList?.data[index] ?? Earthquake(date: "", latitude: 0.0, longitude: 0.0, depth: 0.0, md: "", ml: "", mw: "", place: "", status: "")
        return earthquake
    }
    func getData() {
        
        let url = URL(string:"https://apps.furkansandal.com/st/intern/")!
        
        Webservice().downloadCurrencies(url: url) { [weak self] (earthquakes, err) in
            guard let self = self else { return }
            if let err = err {
                self.alertError?(err)
            }
            if let earthquakes = earthquakes {
                
                print("data")
                self.earthquakeCurrencyList = earthquakes
                self.tempCurrentList = earthquakes
                self.reloadTableView?()
                
                
            }
        }
    }
    func alıstırma(array : [String] , searchBarData : [String]){
        
        
        
        for item in array {
           // searchBarData.append(item)
        }
        }
    }

