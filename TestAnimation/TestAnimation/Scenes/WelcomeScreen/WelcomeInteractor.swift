//
//  WelcomeInteractor.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class WelcomeInteractor {
    private let presenter: WelcomePresentationLogic
    private let worker: WelcomeWorkingLogic

    init(presenter: WelcomePresentationLogic, worker: WelcomeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension WelcomeInteractor: WelcomeBusinessLogic {
    func request(_ request: Welcome.Something.Request) {

    }
}

extension WelcomeInteractor: WelcomeDataStore {}
