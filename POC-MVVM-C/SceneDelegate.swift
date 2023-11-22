//
//  SceneDelegate.swift
//  POC-MVVM-C
//
//  Created by omar thamri on 22/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
                                                    let window = UIWindow(windowScene: windowScene)
                    let applicationCoordinator = ApplicationCoordinator(window: window)
                    applicationCoordinator.start()
                    self.applicationCoordinator = applicationCoordinator
                                                    window.makeKeyAndVisible()
                                                }
    }


}

