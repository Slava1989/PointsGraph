//
//  ApiClient.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation

protocol ServiceAPIProtocol {
    func fetchPoints(numberString: String, completed: @escaping (Points?, NetworkError?) -> Void)
}

class ServiceAPI {
    static let shared: ServiceAPIProtocol = ServiceAPI()
    private init() { }
}

extension ServiceAPI: ServiceAPIProtocol {
    func fetchPoints(numberString: String, completed: @escaping (Points?, NetworkError?) -> Void) {
        let url = NetworkMethod.points(numberString).url

        URLSession.shared
            .dataTask(with: url) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse else {
                    completed(nil, NetworkError.serverError)
                    return
                }

                switch httpResponse.statusCode {
                case 200:
                    do {
                        guard let data = data else {
                            completed(nil, NetworkError.serverError)
                            return
                        }

                        let points = try JSONDecoder().decode(Points.self, from: data)
                        completed(points, nil)
                    } catch {
                        completed(nil, NetworkError.wrongNumber(number: numberString))
                    }


                case 400:
                    completed(nil, NetworkError.wrongNumber(number: numberString))
                case 500:
                    completed(nil, NetworkError.serverError)
                default:
                    completed(nil, NetworkError.serverError)
                }
            }
            .resume()
    }
}


