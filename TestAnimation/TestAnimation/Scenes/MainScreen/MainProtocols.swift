//
//  MainProtocols.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol MainBusinessLogic: AnyObject {
    func request(_ request: Main.Something.Request)
}

protocol MainPresentationLogic: AnyObject {
    func present(_ response: Main.Something.Response)
}

protocol MainDisplayLogic: AnyObject {
    func display(_ viewModel: Main.Something.ViewModel)
}

protocol MainRoutingLogic: AnyObject {
    func show()
}

protocol MainDataStore: AnyObject {}

protocol MainWorkingLogic: AnyObject {}
