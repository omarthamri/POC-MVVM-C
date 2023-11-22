//
//  ApiCaller.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import Foundation

struct Constants {
    static let API_KEY = "6fc06dd43198e0143d6f5bfad2db27cf"
    static let BaseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BaseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
            
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
