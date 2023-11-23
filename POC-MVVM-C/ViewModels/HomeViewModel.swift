//
//  HomeViewModel.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var error: String?
    var row: Int?
    
    func fetchTrendingMovies() {
       APICaller.shared.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }
    
    
}
