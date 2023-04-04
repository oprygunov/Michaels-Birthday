//
//  GiftInteractor.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class GiftInteractor {
    private let presenter: GiftPresentationLogic
    private let worker: GiftWorkingLogic

    init(presenter: GiftPresentationLogic, worker: GiftWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension GiftInteractor: GiftBusinessLogic {
    func request(_ request: Gift.Tap.Request) {
        presenter.present(Gift.Tap.Response())
    }
}

extension GiftInteractor: GiftDataStore {}
