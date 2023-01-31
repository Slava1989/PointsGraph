//
//  UIViewController+Extensions.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}
