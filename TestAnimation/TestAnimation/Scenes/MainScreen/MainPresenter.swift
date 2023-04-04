//
//  MainPresenter.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class MainPresenter {
    weak var view: MainDisplayLogic?

    init(view: MainDisplayLogic) {
        self.view = view
    }
}

extension MainPresenter: MainPresentationLogic {
    func present(_ response: Main.Tap.Response) {
        view?.display(Main.Tap.ViewModel())
    }
}
