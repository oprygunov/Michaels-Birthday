//
//  WelcomeView.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import Lottie

final class WelcomeView: View {

    private let lottie: LottieAnimationView = {
        let view = LottieAnimationView(name: "box-opening")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
//        view.animationProgress = 0.2
        view.play(fromProgress: 0.23, toProgress: 0.3, loopMode: .autoReverse, completion: nil)
        view.animationSpeed = 0.6
//        view.play()
//        view.loopMode = .loop
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(lottie)
        backgroundColor = .white
    }

    override func setupLayout() {
        super.setupLayout()
        lottie.centerXAnchor ~= centerXAnchor
        lottie.centerYAnchor ~= centerYAnchor
    }
}

