//
//  GiftCustomView.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//

import UIKit
import Lottie

public class GiftCustomView: UIControl {
    
    var actionHandler: () -> Void = {}
    
    private let lottie: LottieAnimationView = {
        let view = LottieAnimationView(name: "jumping-gift")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .loop
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        addSubview(lottie)
        lottie.pinToSuperview()
        
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler()
                }
            ),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
