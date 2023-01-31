//
//  TableScreenController.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit
import Charts

final class TableScreenController: UIViewController, UIImagePickerControllerDelegate {
    var viewModel: TableScreenViewModel?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()


    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var chartView: LineChartView = {
        let view = LineChartView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: TableScreenViewModel) {
        super.init(nibName: nil, bundle: nil)

        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupTableView()
        setupUI()
        setupCharts()
    }

    private func setupTableView() {
        tableView.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
    }

    private func setupCharts() {
        chartView.data = viewModel?.setupCharts()
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tableView)
        contentView.addSubview(chartView)

        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4),
            tableView.heightAnchor.constraint(equalToConstant: viewModel?.getTableHeightValue() ?? 0),

            chartView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            chartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            chartView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.5)
        ])

        let rightBarButtonItem =  UIBarButtonItem(title: "Сохранить График", style: .plain, target: self, action: #selector(didTapSave))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }


    @objc func didTapSave() {
        let image = UIImage.init(view: chartView)
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            self.showAlert(title: "Ошибка", message: "Произошла ошибка")
        }
        else {
            self.showAlert(title: "Картинка сохранена", message: "График сохранен в галереи")
        }
    }
}
