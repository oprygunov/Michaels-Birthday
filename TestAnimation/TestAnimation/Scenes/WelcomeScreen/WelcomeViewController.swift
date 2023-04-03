//
//  WelcomeViewController.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    var interactor: WelcomeBusinessLogic?
    var router: WelcomeRoutingLogic?

    private let rootView = WelcomeView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension WelcomeViewController: WelcomeDisplayLogic {
    func display(_ viewModel: Welcome.Something.ViewModel) {

    }
}
