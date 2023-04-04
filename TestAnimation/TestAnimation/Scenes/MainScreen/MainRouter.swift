//
//  MainRouter.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class MainRouter {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?

    init(viewController: MainViewController, dataStore: MainDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension MainRouter: MainRoutingLogic {
    func next() {
        viewController?.navigationController?.pushViewController(GiftBuilder.build(), animated: true)
    }
}
