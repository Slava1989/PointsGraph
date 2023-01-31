//
//  NetworkMethod.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation

enum NetworkMethod {
    static let baseURL = "https://hr-challenge.interactivestandard.com/api/test/points"

    case points(String)

    var url: URL {
        switch self {
        case .points(let number):
            var urlComponents = URLComponents(string: NetworkMethod.baseURL)!
            urlComponents.queryItems = [
                 URLQueryItem(name: "count", value: "\(number)")
            ]

            return urlComponents.url!
        }
    }
}
