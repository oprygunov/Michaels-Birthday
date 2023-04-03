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
    
    private var firstTap: Bool = false
    private var secondTap: Bool = false
    
    init(presenter: WelcomePresentationLogic, worker: WelcomeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension WelcomeInteractor: WelcomeBusinessLogic {
    func request(_ request: Welcome.Tap.Request) {
        if !firstTap {
            self.firstTap = true
            presenter.present(Welcome.Tap.Response(
                model: .init(firstTap: firstTap, secondTap: secondTap))
            )
        }
        else {
            self.secondTap = true
            presenter.present(Welcome.Tap.Response(
                model: .init(firstTap: firstTap, secondTap: secondTap))
            )
        }
    }
}

extension WelcomeInteractor: WelcomeDataStore {}
