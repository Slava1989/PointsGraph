//
//  TableCell.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

final class TableCell: UITableViewCell {
    private lazy var coordinateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(coordinateLabel)

        NSLayoutConstraint.activate([
            coordinateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            coordinateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func configureCell(coordinate: Coordinates) {
        self.coordinateLabel.text = "X=\(coordinate.coordX), Y=\(coordinate.coordY)"
    }

}
