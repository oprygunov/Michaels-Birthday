//
//  GiftView.swift
//  TestAnimation
//
//  Created by Oleg Prygunov on 04.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import AVFoundation
import Lottie
import SafariServices

final class GiftView: View {
    
    enum Action {
        case tap
    }

    var actionHandler: (Action) -> Void = { _ in }

    var audioPlayer: AVAudioPlayer?

    private let cover: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "image-rap")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private var text: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Ну а на этой странице мы передаём слово твоим старым друзьям! \n Настя, Серёга, Оля, Санёк, Роман, Лиля, Даша и Вадим передают тебе тысячу поцелуев и вот этоn вот qr-код. \n Бери и танцуй!!!"
        view.textAlignment = .center
        view.textColor = .black
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont(name: "Akrobat-Regular", size: 20)
        return view
    }()

    private let qr: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ticket")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let lottieMusicBar: LottieAnimationView = {
        let view = LottieAnimationView(name: "music-rhythm")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.play()
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.alpha = 1
        return view
    }()

    private lazy var button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("забрать без QR", for: .normal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.tap)
                    view.layer.borderWidth = 0.5
                    view.layer.borderColor = UIColor.black.cgColor
                    view.backgroundColor = #colorLiteral(red: 0.9995661378, green: 0.07507731766, blue: 0.4479991198, alpha: 0.904602466)
                }
            ),
            for: .touchUpInside
        )
        view.addAction(
            UIAction(
                handler: { _ in
                    view.layer.borderWidth = 1
                    view.layer.borderColor = UIColor.black.cgColor
                    view.backgroundColor = #colorLiteral(red: 0.9995661378, green: 0.07507731766, blue: 0.4479991198, alpha: 0.904602466)
                }
            ),
            for: .touchDown
        )
        view.addAction(
            UIAction(
                handler: { _ in
                    view.backgroundColor = #colorLiteral(red: 0.9995661378, green: 0.07507731766, blue: 0.4479991198, alpha: 1)
                    view.layer.borderWidth = 0
                }
            ),
            for: .touchUpOutside
        )
        view.backgroundColor = #colorLiteral(red: 0.9995661378, green: 0.07507731766, blue: 0.4479991198, alpha: 1)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Akrobat-Regular", size: 14)

        return view
    }()

    private var textSecond: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Дезигн энд девелопмент бай:"
        view.textAlignment = .center
        view.textColor = .black
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont(name: "Akrobat-Regular", size: 12)
        return view
    }()

    private var textThird: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Прыгунов Олег и Мухин Вадим"
        view.textColor = #colorLiteral(red: 0.9995661378, green: 0.07507731766, blue: 0.4479991198, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont(name: "Akrobat-Regular", size: 14)
        return view
    }()


    override func setupContent() {
        super.setupContent()
        backgroundColor = .white

        guard let path = Bundle.main.path(forResource: "musicRap", ofType: "mp3") else { return }
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
        addSubview(cover)
        addSubview(text)
        addSubview(qr)
        addSubview(lottieMusicBar)
        addSubview(button)
        addSubview(textSecond)
        addSubview(textThird)

        cover.topAnchor ~= topAnchor - 160
        cover.leftAnchor ~= leftAnchor + 10
        cover.rightAnchor ~= rightAnchor - 10

        text.centerXAnchor ~= centerXAnchor
        text.topAnchor ~= cover.bottomAnchor - 200
        text.leftAnchor ~= leftAnchor + 30

        qr.topAnchor ~= centerYAnchor - 150
        qr.leftAnchor ~= leftAnchor + 125
        qr.rightAnchor ~= rightAnchor - 125

        lottieMusicBar.centerXAnchor ~= centerXAnchor - 6
        lottieMusicBar.centerYAnchor ~= centerYAnchor + 200

        button.topAnchor ~= centerYAnchor + 210
        button.centerXAnchor ~= centerXAnchor
        button.widthAnchor ~= 259
        button.heightAnchor ~= 40

        textSecond.leftAnchor ~= leftAnchor + 40
        textSecond.bottomAnchor ~= bottomAnchor - 60

        textThird.leftAnchor ~= textSecond.rightAnchor + 5
        textThird.bottomAnchor ~= textSecond.bottomAnchor
    }
}
