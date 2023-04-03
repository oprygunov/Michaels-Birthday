//
//  WelcomeProtocols.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol WelcomeBusinessLogic: AnyObject {
    func request(_ request: Welcome.Something.Request)
}

protocol WelcomePresentationLogic: AnyObject {
    func present(_ response: Welcome.Something.Response)
}

protocol WelcomeDisplayLogic: AnyObject {
    func display(_ viewModel: Welcome.Something.ViewModel)
}

protocol WelcomeRoutingLogic: AnyObject {
    func show()
}

protocol WelcomeDataStore: AnyObject {}

protocol WelcomeWorkingLogic: AnyObject {}
