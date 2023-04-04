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

    private lazy var rootView = GiftView()

    override func loadView() {
        super.loadView()
        view = rootView

        rootView.actionHandler = { action in
            switch action {
            case .tap:
                self.interactor?.request(Gift.Tap.Request())
            }
        }
    }
}

extension GiftViewController: GiftDisplayLogic {
    func display(_ viewModel: Gift.Tap.ViewModel) {
        rootView.audioPlayer?.stop()
        router?.show()
    }
}
