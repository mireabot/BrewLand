//
//  APIManager.swift
//  BrewLand
//
//  Created by Mikhail Kolkov on 11/10/22.
//

import UIKit

class Networkmanager {
    static let shared = Networkmanager()
    private let baseUrl = "https://api.openbrewerydb.org/breweries"
    
    private init() {}
    
    func getBreweryData(page: Int, completion: @escaping(Result<[Brewery], Errors>) -> Void) {
        let endpoint = baseUrl + "?per_page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, err in
            // If unable to perform request
            if let _ = err {
                completion(.failure(.checkConnection))
                return
            }
            // If unsuccessfull result, 200 - OK
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            // If data was incorrect
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Brewery].self, from: data)
                completion(.success(followers))
                
            } catch {
                completion(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
}
