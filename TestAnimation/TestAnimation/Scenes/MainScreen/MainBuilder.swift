//
//  MainBuilder.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class MainBuilder {
    static func build() -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(
            presenter: presenter,
            worker: MainWorker()
        )
        let router = MainRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
