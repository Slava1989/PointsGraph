//
//  TableScreenViewModel.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit
import Charts

protocol TableScreenProtocol: AnyObject {
    func getTableHeightValue() -> CGFloat
    func sortCoordinates() -> [Coordinates]
    func setupCharts() -> LineChartData
}

final class TableScreenViewModel: NSObject {
    var coordinatePoints: Points

    init(points: Points) {
        self.coordinatePoints = points
    }
}

extension TableScreenViewModel: TableScreenProtocol {
    func getTableHeightValue() -> CGFloat {
        let numberOfPoints = coordinatePoints.points.count
        return CGFloat(numberOfPoints >= 10 ? 45 * 10 : 45 * numberOfPoints)
    }

    func sortCoordinates() -> [Coordinates] {
        return coordinatePoints.points.sorted { $0.coordX < $1.coordX }
    }

    func setupCharts() -> LineChartData {
        var dataEntries: [ChartDataEntry] = []
        let coordinates = sortCoordinates()

        for i in 0..<coordinates.count-1 {
            let dataEntry = ChartDataEntry(x: coordinates[i].coordX, y: coordinates[i].coordY)
            dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries)
        lineChartDataSet.mode = .horizontalBezier
        lineChartDataSet.drawCirclesEnabled = true
        lineChartDataSet.circleRadius = 5
        lineChartDataSet.setCircleColor(.black)

        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartData.setDrawValues(false)
        return lineChartData
    }
}

extension TableScreenViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coordinatePoints.points.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }

        let coordinatePoints = coordinatePoints

        cell.configureCell(coordinate: coordinatePoints.points[indexPath.row])
        return cell
    }
}

extension TableScreenViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
