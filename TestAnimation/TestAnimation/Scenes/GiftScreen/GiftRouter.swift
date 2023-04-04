//
//  GiftRouter.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class GiftRouter {
    weak var viewController: GiftViewController?
    var dataStore: GiftDataStore?

    init(viewController: GiftViewController, dataStore: GiftDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension GiftRouter: GiftRoutingLogic {
    func show() {

    }
}
