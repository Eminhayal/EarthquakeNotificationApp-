//
//  earthquakeCurrency.swift
//  EarthquakeNotificationApp
//
//  Created by Emin Hayal on 11.07.2021.
//

import Foundation

// MARK: - Welcome
struct EarthquakeCurrency: Decodable {
    let success: Bool
    var data: [Earthquake]
}

// MARK: - Datum
struct Earthquake: Decodable {
    let date: String
    let latitude, longitude, depth: Double
    let md, ml, mw, place: String
    let status: String
}
