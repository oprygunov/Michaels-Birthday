//
//  GiftRouter.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import SafariServices

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
        guard let url = URL(string: "https://drive.google.com/file/d/198SISsAiPX44hx1H_IHEN_yYNCPC7-NW/view?usp=share_link") else { return }
        UIApplication.shared.open(url)
    }
}
