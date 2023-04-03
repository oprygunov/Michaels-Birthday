//
//  WelcomeModels.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

enum Welcome {
    
    enum Tap {
        struct Request {}

        struct Response {
            var model:  Model
        }

        struct ViewModel {
            var root:  RootViewModel
        }
    }
    
    struct Model {
        var firstTap: Bool
        var secondTap: Bool
    }
    
    struct RootViewModel {
        var firstTap: Bool
        var secondTap: Bool
    }
}
