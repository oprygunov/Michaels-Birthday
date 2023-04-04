//
//  MainView.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie

final class MainView: View {
    
    enum Action {
        case tap
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    private let imageArray = [UIImage(named: "image1"), UIImage(named: "image2")]
    private var currentImageIndex = 0
    private let gradientLayer = CAGradientLayer()
    var audioPlayer: AVAudioPlayer?
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let barBack: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "wine")
        return view
    }()
    
    private let lottie: LottieAnimationView = {
        let view = LottieAnimationView(name: "confetti3")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .loop
        view.alpha = 0.6
        return view
    }()
    
    private let lottieConfetti: LottieAnimationView = {
        let view = LottieAnimationView(name: "confetti3")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.play()
        view.loopMode = .loop
        view.alpha = 0.6
        return view
    }()
    
    private let tableImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bar")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let lottieBack: LottieAnimationView = {
        let view = LottieAnimationView(name: "backdot")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.play()
        view.loopMode = .loop
        view.alpha = 0.7
        return view
    }()
    
    private lazy var gift: GiftCustomView = {
        let view = GiftCustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        view.actionHandler = {
            self.actionHandler(.tap)
        }
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    override func setupContent() {
        super.setupContent()

        let gradientColors = [#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1).cgColor, #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor]

        gradientLayer.colors = gradientColors
        gradientLayer.locations = [0.0, 0.3, 0.7, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
        backgroundColor = #colorLiteral(red: 0.8721764684, green: 0.7579173446, blue: 0.8361523747, alpha: 0.8682504252)
        addSubview(lottieBack)
        addSubview(lottieBack)
        addSubview(barBack)
        addSubview(image)
        addSubview(tableImage)
        addSubview(lottie)
        addSubview(lottieConfetti)
        addSubview(gift)
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            UIView.transition(with: self.image, duration: 0, options: .transitionCrossDissolve, animations: {
                let currentImage = self.imageArray[self.currentImageIndex]
                self.image.image = currentImage
                self.currentImageIndex = (self.currentImageIndex + 1) % self.imageArray.count
            }, completion: nil)
        }
        
        guard let path = Bundle.main.path(forResource: "musicFast", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Failed to play background music")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.gift.alpha = 1
        }
    }
    
    override func setupLayout() {
        super.setupLayout()
        lottieBack.pinToSuperview()
        
        barBack.topAnchor ~= topAnchor
        barBack.leftAnchor ~= leftAnchor
        barBack.rightAnchor ~= rightAnchor
        barBack.heightAnchor ~= 450
        
        image.centerXAnchor ~= centerXAnchor
        image.leftAnchor ~= leftAnchor - 30
        image.centerYAnchor ~= centerYAnchor
        
        lottieConfetti.leftAnchor ~= leftAnchor - 60
        lottieConfetti.rightAnchor ~= rightAnchor + 100
        lottieConfetti.centerYAnchor ~= centerYAnchor - 50
        
        tableImage.bottomAnchor ~= bottomAnchor + 150
        tableImage.leftAnchor ~= leftAnchor
        tableImage.widthAnchor ~= 620
        tableImage.heightAnchor ~= 600
        
        gift.heightAnchor ~= 200
        gift.widthAnchor ~= 200
        gift.centerYAnchor ~= centerYAnchor + 100
        gift.rightAnchor ~= rightAnchor + 30
    }
}
