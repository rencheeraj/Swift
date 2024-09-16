//
//  DataService.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation

class DataService {
    // URL for the mock API
    private static let apiURL = URL(string: "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo")!
    
    // Fetch content data from the given API URL
    static func fetchContentData() async throws -> [Content] {
        // Make a network request to fetch data from the API
        let (data, response) = try await URLSession.shared.data(from: apiURL)
        
        // Check if the response status code is 200 (OK)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decode the JSON data
        let decodedData = try JSONDecoder().decode([Content].self, from: data)
        return decodedData
    }
}

