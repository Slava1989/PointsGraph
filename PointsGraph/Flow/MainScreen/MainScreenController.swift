//
//  MainScreenController.swift
//  PointsGraph
//
//  Created by Veaceslav Chirita on 04.08.2022.
//

import UIKit

final class MainScreenController: UIViewController {
    var viewModel: MainScreenViewModel?

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите нужное количество точек"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Число"
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var proceedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Поехали", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapProceedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    init(viewModel: MainScreenViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        viewModel = nil
    }

    override func viewDidLoad() {
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(numberTextField)
        stackView.addArrangedSubview(proceedButton)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            messageLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            numberTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            numberTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            numberTextField.heightAnchor.constraint(equalToConstant: 45),

            proceedButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            proceedButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            proceedButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    @objc func didTapProceedButton() {
        viewModel?.didTapProceedButton(numberString: numberTextField.text ?? "") { [weak self] points , errorMessage in
            self?.showAlert(title: "Ошибка", message: errorMessage ?? "")
        }
    }
}
