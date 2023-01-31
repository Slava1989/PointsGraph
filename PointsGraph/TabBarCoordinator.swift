//
//  TabBarCoordinator.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 11.12.2022.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var rootViewController: UINavigationController
    var childCoordinator = [Coordinator]()

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let tabBarController = BreakingPointTabBarController()
        rootViewController.pushViewController(tabBarController, animated: true)
    }

    func stop() {

    }
 }
