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

    private var audioPlayer: AVAudioPlayer?

    private let barBack: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "wine")
        return view
    }()

    private let lottie: LottieAnimationView = {
        let view = LottieAnimationView(name: "confetti3")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.play()
        view.loopMode = .loop
        return view
    }()

    private lazy var imageView: UIImageView = {
        // Получаем путь к GIF файлу из Assets
        guard let path = Bundle.main.path(forResource: "dance", ofType: "gif") else { return UIImageView() }
        let url = URL(fileURLWithPath: path)

        // Создаем объект анимированной картинки из GIF файла
        guard let data = try? Data(contentsOf: url), let image = UIImage.gif(data: data) else { return UIImageView() }

        // Устанавливаем анимированную картинку в UIImageView
        let view = UIImageView(image: image)
        // Устанавливаем количество повторов анимации на бесконечность
        view.animationRepeatCount = 0
        // Устанавливаем размеры UIImageView
        //        view.frame = CGRect(x: 0, y: 0, width: 200, height: 340)
        // Устанавливаем центр UIImageView на середину экрана
        // view.center = self.center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tableImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "bar")
        return view
    }()

    private let lottieConfetti: LottieAnimationView = {
        let view = LottieAnimationView(name: "confetti3")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.play()
        view.loopMode = .loop
        return view
    }()


    override func setupContent() {
        super.setupContent()

        backgroundColor = .white
        addSubview(barBack)

        addSubview(imageView)

        addSubview(tableImage)

        addSubview(lottie)
        addSubview(lottieConfetti)

        // Запускаем анимацию
        //imageView.startAnimating()

        // Создаем объект AVAudioPlayer
        guard let path = Bundle.main.path(forResource: "musicFast", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // -1 означает, что музыка будет воспроизводиться бесконечно
            audioPlayer?.play()
        } catch {
            print("Failed to play background music")
        }
    }

    override func setupLayout() {
        super.setupLayout()

        barBack.topAnchor ~= topAnchor - 265
        barBack.leftAnchor ~= leftAnchor
        barBack.rightAnchor ~= rightAnchor
        //        barBack.widthAnchor ~= 400



        lottie.leftAnchor ~= leftAnchor
        lottie.centerYAnchor ~= centerYAnchor - 200
        lottie.centerXAnchor ~= centerXAnchor


        //        imageView.center = center
        imageView.centerXAnchor ~= centerXAnchor
        imageView.centerYAnchor ~= centerYAnchor

        tableImage.bottomAnchor ~= bottomAnchor
        tableImage.leftAnchor ~= leftAnchor
        tableImage.rightAnchor ~= rightAnchor
        //        boxImage.widthAnchor ~= 300
        tableImage.heightAnchor ~= 280

        //        lottieTable.topAnchor ~= topAnchor
        //        lottieConfetti.leftAnchor ~= leftAnchor
        //        lottieTable.rightAnchor ~= rightAnchor
        //        lottieConfetti.bottomAnchor ~= bottomAnchor

        //        lottieTable.centerYAnchor ~= centerYAnchor - 180
        //        lottieTable.centerXAnchor ~= centerXAnchor

    }

    deinit {
        // Остановить проигрывание музыки при удалении экрана
        audioPlayer?.stop()
    }
}


extension UIImage {
    static func gif(data: Data) -> UIImage? {
        // Создаем объект CGImageSource из переданных данных
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        // Получаем количество кадров GIF изображения
        let count = CGImageSourceGetCount(source)

        // Получаем кадры GIF изображения и добавляем их в массив
        var images: [UIImage] = []
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }

        // Создаем анимированную картинку из кадров GIF изображения
        return UIImage.animatedImage(with: images, duration: 1.0)
    }
}

