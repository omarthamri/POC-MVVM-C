//
//  HomeCoordinator.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import UIKit
import SwiftUI

class HomeCoordinator: NSObject,Coordinator {
    
    var rootViewController: UINavigationController
    let viewModel = HomeViewModel()
    lazy var homeViewController: HomeViewController = {
           let vc = HomeViewController()
            vc.viewModel = viewModel
            vc.showDetailRequest = { [weak self] row in
                self?.goToDetails(row: row)
            }
            vc.title = "Trending Movies"
            return vc
        }()
        
        override init() {
            rootViewController = UINavigationController()
            super.init()
        }
    
    func start() {
        rootViewController.setViewControllers([homeViewController], animated: false)
    }
    
    func goToDetails(row: Int) {
        let detailViewController = DetailMovieViewController()
        viewModel.row = row
        detailViewController.viewModel = viewModel
        detailViewController.title = viewModel.movies[row].original_name ?? viewModel.movies[row].original_title ?? viewModel.movies[row].name ?? ""
        rootViewController.pushViewController(detailViewController, animated: true)
        }
}
