//
//  MainView.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class MainView: UIView {

    private lazy var imageView: UIImageView = {
        // Получаем путь к GIF файлу из Assets
        guard let path = Bundle.main.path(forResource: "20230403_171625", ofType: "gif") else { return UIImageView() }
        let url = URL(fileURLWithPath: path)

        // Создаем объект анимированной картинки из GIF файла
        guard let data = try? Data(contentsOf: url), let image = UIImage.gif(data: data) else { return UIImageView() }

        // Устанавливаем анимированную картинку в UIImageView
        let view = UIImageView(image: image)
        // Устанавливаем количество повторов анимации на бесконечность
        view.animationRepeatCount = 0
        // Устанавливаем размеры UIImageView
//        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // Устанавливаем центр UIImageView на середину экрана
        view.center = self.center
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContent()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContent()
    }

    private func setupContent() {
        backgroundColor = .white
        addSubview(imageView)

        // Запускаем анимацию
        imageView.startAnimating()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.center = center
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

