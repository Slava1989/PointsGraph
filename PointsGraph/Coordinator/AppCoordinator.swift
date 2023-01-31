//
//  AppCoordinator.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordinator = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
}
