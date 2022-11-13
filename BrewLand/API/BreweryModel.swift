//
//  BreweryModel.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/13/22.
//

import Foundation


struct Brewery: Codable {
    var id: String
    var name: String
    var breweryType: String
    var street: String
    var city: String
    var state: String
    var postalCode: String
}
