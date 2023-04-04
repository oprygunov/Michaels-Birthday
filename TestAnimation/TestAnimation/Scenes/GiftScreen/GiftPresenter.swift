//
//  GiftPresenter.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class GiftPresenter {
    weak var view: GiftDisplayLogic?

    init(view: GiftDisplayLogic) {
        self.view = view
    }
}

extension GiftPresenter: GiftPresentationLogic {
    func present(_ response: Gift.Tap.Response) {
        view?.display(Gift.Tap.ViewModel())
    }
}
