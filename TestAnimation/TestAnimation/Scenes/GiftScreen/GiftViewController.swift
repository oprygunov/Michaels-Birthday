//
//  GiftViewController.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class GiftViewController: UIViewController {
    var interactor: GiftBusinessLogic?
    var router: GiftRoutingLogic?

    private let rootView = GiftView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension GiftViewController: GiftDisplayLogic {
    func display(_ viewModel: Gift.Something.ViewModel) {

    }
}
