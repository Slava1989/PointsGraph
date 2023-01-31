//
//  PointModel.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import Foundation

struct Points: Codable {
    var points: [Coordinates]
}

struct Coordinates: Codable {
    var coordX: Double
    var coordY: Double

    enum CodingKeys: String, CodingKey {
        case coordX = "x"
        case coordY = "y"
    }
}
