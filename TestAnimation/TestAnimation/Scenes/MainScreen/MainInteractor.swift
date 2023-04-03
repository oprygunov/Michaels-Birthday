//
//  MainInteractor.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class MainInteractor {
    private let presenter: MainPresentationLogic
    private let worker: MainWorkingLogic

    init(presenter: MainPresentationLogic, worker: MainWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MainInteractor: MainBusinessLogic {
    func request(_ request: Main.Something.Request) {

    }
}

extension MainInteractor: MainDataStore {}
