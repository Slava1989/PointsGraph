//
//  NetworkError.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation

enum NetworkError: Error {
    case wrongNumber(number: String)
    case serverError

    var errorDescription: String {
        switch self {
        case .wrongNumber(let number): return "Неправильные данные"
        case .serverError: return "Произошла ошибка на сервере"
        }
    }
}
