//
//  WelcomeProtocols.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol WelcomeBusinessLogic: AnyObject {
    func request(_ request: Welcome.Tap.Request)
}

protocol WelcomePresentationLogic: AnyObject {
    func present(_ response: Welcome.Tap.Response)
}

protocol WelcomeDisplayLogic: AnyObject {
    func display(_ viewModel: Welcome.Tap.ViewModel)
}

protocol WelcomeRoutingLogic: AnyObject {
    func next()
}

protocol WelcomeDataStore: AnyObject {}

protocol WelcomeWorkingLogic: AnyObject {}
