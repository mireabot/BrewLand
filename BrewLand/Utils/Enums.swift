//
//  Enums.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/10/22.
//

import Foundation


enum ErrorMessages: String {
    case badResponse = "Something went wrong"
}

enum APIMethod: String {
    case Get = "GET"
    case Post = "POST"
}

enum Errors: String, Error {
    case invalidUsername = "Username is invalid."
    case checkConnection = "Unable to complete request due to connection error."
    case invalidResponse = "Invalid response from server. Try again."
    case invalidData = "The data was received incorrect."
    case unableToFavorite = "Unable to add user to favorites"
    case inFavorites = "This user is already in favorite list"
}
