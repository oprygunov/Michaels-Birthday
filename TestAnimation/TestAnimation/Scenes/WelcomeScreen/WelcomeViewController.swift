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

    private lazy var rootView = WelcomeView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .tap:
                self.interactor?.request(Welcome.Tap.Request())
            }
        }
    }

}

extension WelcomeViewController: WelcomeDisplayLogic {
    func display(_ viewModel: Welcome.Tap.ViewModel) {
        if !viewModel.root.secondTap {
            rootView.viewModel = viewModel.root
        }
        else {
            rootView.audioPlayer?.stop()
            router?.next()
        }
    }
}
