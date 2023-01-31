//
//  BreakingPointTabBarController.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 11.12.2022.
//

import UIKit

class BreakingPointTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let nav1 = generateNavController(vc: UIViewController(), title: "First", image: UIImage(systemName: "homekit")!)
        let nav2 = generateNavController(vc: UIViewController(), title: "Second", image: UIImage(systemName: "list.bullet")!)
        let nav3 = generateNavController(vc: UIViewController(), title: "Third", image: UIImage(systemName: "heart.text.square")!)

        viewControllers = [nav1, nav2, nav3]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("here")
    }

    fileprivate func generateNavController(vc: UIViewController, title: String,image: UIImage) -> UINavigationController {
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }

}
