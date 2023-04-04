//
//  GiftBuilder.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class GiftBuilder {
    static func build() -> UIViewController {
        let viewController = GiftViewController()
        let presenter = GiftPresenter(view: viewController)
        let interactor = GiftInteractor(
            presenter: presenter,
            worker: GiftWorker()
        )
        let router = GiftRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
