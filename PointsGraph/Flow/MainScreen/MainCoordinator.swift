//
//  MainCoordinator.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    var rootViewController: UINavigationController
    var childCoordinator = [Coordinator]()

    init() {
        self.rootViewController = UINavigationController()
    }

    func start() {
        let mainViewModel = MainScreenViewModel(coordinator: self)
        let mainVC = MainScreenController(viewModel: mainViewModel)

        rootViewController.setViewControllers([mainVC], animated: true)
    }

    func goToTable(points: Points) {
        let tableCoordinator = TableScreenCoordinator(rootViewController: rootViewController, points: points)
//        TabBarCoordinator(rootViewController: rootViewController)
        tableCoordinator.start()
    }
 }
