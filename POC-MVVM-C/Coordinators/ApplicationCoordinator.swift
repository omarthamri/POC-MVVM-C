//
//  ApplicationCoordinator.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import UIKit
import SwiftUI
import Combine

protocol Coordinator {
    
    func start()
    
}

class ApplicationCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    let window: UIWindow
       init(window: UIWindow) {
           self.window = window
       }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        childCoordinators = [homeCoordinator]
        window.rootViewController = homeCoordinator.rootViewController
    }
    
    
    
    
    
}




