//
//  TableScreenCoordinator.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation
import UIKit

final class TableScreenCoordinator: Coordinator {
    var rootViewController: UINavigationController
    var points: Points

    init(rootViewController: UINavigationController, points: Points)  {
        self.rootViewController = rootViewController
        self.points = points
    }

    func start() {
        let viewModel = TableScreenViewModel(points: points)
        let tableVC = TableScreenController(viewModel: viewModel)

        rootViewController.pushViewController(tableVC, animated: true)
    }
}
