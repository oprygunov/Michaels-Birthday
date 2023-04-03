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
    
    private let imageArray = [UIImage(named: "image1"), UIImage(named: "image2")]
    private var currentImageIndex = 0
    private var audioPlayer: AVAudioPlayer?
    
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
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(barBack)
        addSubview(image)
        addSubview(tableImage)
        addSubview(lottie)
        addSubview(lottieConfetti)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
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
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        barBack.topAnchor ~= safeAreaLayoutGuide.topAnchor
        barBack.leftAnchor ~= leftAnchor
        barBack.rightAnchor ~= rightAnchor
        barBack.heightAnchor ~= 300
        
        image.centerXAnchor ~= centerXAnchor
        image.leftAnchor ~= leftAnchor - 30
        image.centerYAnchor ~= centerYAnchor
        
        lottieConfetti.leftAnchor ~= leftAnchor - 60
        lottieConfetti.rightAnchor ~= rightAnchor + 100
        lottieConfetti.centerYAnchor ~= centerYAnchor - 50
        
        tableImage.bottomAnchor ~= bottomAnchor
        tableImage.leftAnchor ~= leftAnchor
        tableImage.rightAnchor ~= rightAnchor
        tableImage.heightAnchor ~= 280
    }
}
