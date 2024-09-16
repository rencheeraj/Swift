//
//  APIService.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//
import Foundation

// MARK: - API Service
class ApiService {
    static let shared = ApiService() // Singleton instance
    
    private let baseUrl = "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo"

    // MARK: - Fetch Content Data
    func fetchContent(completion: @escaping (Result<Contents, Error>) -> Void) {
        // Ensure the URL is valid
        guard let url = URL(string: baseUrl) else {
            print("Invalid URL")
            return
        }

        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Handle the response data
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // Decode the data into an array of Content
                let contentData = try JSONDecoder().decode(Contents.self, from: data)
                // Pass the decoded data to the completion handler
                completion(.success(contentData))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume() // Start the network task
    }
}
