//
//  GiftProtocols.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol GiftBusinessLogic: AnyObject {
    func request(_ request: Gift.Something.Request)
}

protocol GiftPresentationLogic: AnyObject {
    func present(_ response: Gift.Something.Response)
}

protocol GiftDisplayLogic: AnyObject {
    func display(_ viewModel: Gift.Something.ViewModel)
}

protocol GiftRoutingLogic: AnyObject {
    func show()
}

protocol GiftDataStore: AnyObject {}

protocol GiftWorkingLogic: AnyObject {}
