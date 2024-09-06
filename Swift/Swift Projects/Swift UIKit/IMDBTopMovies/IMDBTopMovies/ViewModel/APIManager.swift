//
//  APIManager.swift
//  IMDBTopMovies
//
//  Created by Rencheeraj Mohan on 05/09/24.
//

import Foundation

protocol APIServiceDelegate: AnyObject{
    func didFetchMoviesSuccess(_ data: [MovieModel])
    func didFailWithError(_ error: Error)
}

class APIManager {
    static let shared = APIManager()
        
        weak var delegate: APIServiceDelegate?
        
        private init() {}
        
        func fetchMovies() {
            let headers = [
                "x-rapidapi-key": "f8a0cbd106msh9d4f125a8372dadp11b23cjsn4406a03e6e4b",
                "x-rapidapi-host": "imdb-top-100-movies.p.rapidapi.com"
            ]
            
            guard let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/") else {
                return
            }
            
            let request = NSMutableURLRequest(url: url,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
                if let error = error {
                    // Handle networking error (e.g., no internet connection)
                    self?.delegate?.didFailWithError(error)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    // Check for HTTP status code errors
                    let statusCode = httpResponse.statusCode
                    if statusCode >= 200 && statusCode < 300 {
                        // Success response
                        if let data = data {
                            do {
                                let items = try JSONDecoder().decode([MovieModel].self, from: data)
                                self?.delegate?.didFetchMoviesSuccess(items)
                            } catch let jsonError {
                                self?.delegate?.didFailWithError(jsonError)
                            }
                        }
                    } else {
                        // HTTP error (e.g., 404, 500)
                        let httpError = NSError(domain: "HTTPError", code: statusCode, userInfo: [NSLocalizedDescriptionKey : HTTPURLResponse.localizedString(forStatusCode: statusCode)])
                        self?.delegate?.didFailWithError(httpError)
                    }
                }
            }
            
            dataTask.resume()
        }
}
