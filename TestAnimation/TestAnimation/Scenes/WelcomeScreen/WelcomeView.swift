//
//  WelcomeView.swift
//  TestAnimation
//
//  Created by Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import Lottie

final class WelcomeView: UIControl {
    
    enum Action {
        case tap
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: Welcome.RootViewModel = .init(firstTap: false, secondTap: false) {
        didSet {
            if viewModel.firstTap {
                lottie.play(
                    fromProgress: 0.23,
                    toProgress: 1,
                    loopMode: .playOnce,
                    completion: { _ in
                        self.lottie.play(
                            fromProgress: 1,
                            toProgress: 0.7,
                            loopMode: .autoReverse,
                            completion: nil
                        )
                    }
                )
                label.text = ""
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.text.alpha = 0.8
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.label.text = "Нажми еще раз"
                }
            }
        }
    }

    private let lottie: LottieAnimationView = {
        let view = LottieAnimationView(name: "box-opening")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.contentMode = .scaleAspectFit
        view.play(
            fromProgress: 0.23,
            toProgress: 0.3,
            loopMode: .autoReverse,
            completion: nil
        )
        view.animationSpeed = 0.6
        return view
    }()
    
    private var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Akrobat-Bold", size: 30)
        view.text = "Нажми"
        view.textColor = .black
        return view
    }()
    
    private var text: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "TExt fsfsf f sf sf sf s fs f sf sf s fs f sfsfsfsf sfsfsf sf sf sf sf sf sfs fs fsfsfsf sfsf sf sf sfsfsf sfsfsfs fs fs fs f sf sfsfsf sfsf sf sf"
        view.alpha = 0
        view.textAlignment = .center
        view.textColor = .black
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont(name: "Akrobat-Regular", size: 20)
        return view
    }()

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white

        addSubview(lottie)
        addSubview(label)
        addSubview(text)
        
        lottie.centerXAnchor ~= centerXAnchor + 5
        lottie.centerYAnchor ~= centerYAnchor
        
        label.centerXAnchor ~= centerXAnchor
        label.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor - 20
        
        text.centerXAnchor ~= centerXAnchor
        text.topAnchor ~= lottie.topAnchor + 300
        text.leftAnchor ~= leftAnchor + 20
        
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.tap)
                }
            ),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

