//
//  SceneDelegate.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = AppCoordinator(window: window)
            applicationCoordinator.start()

            self.appCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

