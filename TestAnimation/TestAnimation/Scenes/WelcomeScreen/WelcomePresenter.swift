//
//  WelcomePresenter.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class WelcomePresenter {
    weak var view: WelcomeDisplayLogic?

    init(view: WelcomeDisplayLogic) {
        self.view = view
    }
}

extension WelcomePresenter: WelcomePresentationLogic {
    func present(_ response: Welcome.Something.Response) {
        view?.display(Welcome.Something.ViewModel())
    }
}
