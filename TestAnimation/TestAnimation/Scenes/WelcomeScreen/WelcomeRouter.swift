//
//  WelcomeRouter.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class WelcomeRouter {
    weak var viewController: WelcomeViewController?
    var dataStore: WelcomeDataStore?

    init(viewController: WelcomeViewController, dataStore: WelcomeDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension WelcomeRouter: WelcomeRoutingLogic {
    func next() {
        viewController?.navigationController?.pushViewController(MainBuilder.build(), animated: true)
    }
}
