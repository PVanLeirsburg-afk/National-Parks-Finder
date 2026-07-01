//
//  ParkService.swift
//  National Parks Finder
//
//  Created by Pamela VanLeirsburg on 6/30/26.
//

import Foundation

class ParkService {
    
    let apiKey = "LqeeSHB9YmYMlijOmtUmTbJNQl9QwlYC2NYzk0p4"
    
    func fetchParks() async throws -> [Park] {
        
        let urlString = "https://developer.nps.gov/api/v1/parks?limit=50&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(ParkResponse.self, from: data)
        
        return response.data
    }
    
}

