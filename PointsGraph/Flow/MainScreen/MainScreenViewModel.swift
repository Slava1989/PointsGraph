//
//  MainScreenViewModel.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation

protocol MainScreenProtocol: AnyObject {
    func didTapProceedButton(numberString: String, completed: @escaping (Points?, String?) -> Void)
}

final class MainScreenViewModel {
    var coordinator: MainCoordinator

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainScreenViewModel: MainScreenProtocol {
    func didTapProceedButton(numberString: String, completed: @escaping (Points?, String?) -> Void) {
        ServiceAPI.shared.fetchPoints(numberString: numberString) { [weak self] points, networkError in
            if networkError != nil {
                DispatchQueue.main.async {
                    completed(nil, networkError?.errorDescription)
                }

                return
            }

            DispatchQueue.main.async {
                guard let points = points else {
                    completed(nil, networkError?.errorDescription)
                    return
                }

                self?.coordinator.goToTable(points: points)
            }
        }
    }
}
