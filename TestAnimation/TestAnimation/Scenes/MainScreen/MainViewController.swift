//
//  MainViewController.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: MainRoutingLogic?

    private let rootView = MainView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension MainViewController: MainDisplayLogic {
    func display(_ viewModel: Main.Something.ViewModel) {

    }
}
