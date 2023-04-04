//
//  MainProtocols.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol MainBusinessLogic: AnyObject {
    func request(_ request: Main.Tap.Request)
}

protocol MainPresentationLogic: AnyObject {
    func present(_ response: Main.Tap.Response)
}

protocol MainDisplayLogic: AnyObject {
    func display(_ viewModel: Main.Tap.ViewModel)
}

protocol MainRoutingLogic: AnyObject {
    func next()
}

protocol MainDataStore: AnyObject {}

protocol MainWorkingLogic: AnyObject {}
