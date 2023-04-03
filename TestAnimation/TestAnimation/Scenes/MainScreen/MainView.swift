//
//  MainView.swift
//  TestAnimation
//
//  Created by Oleg Prygunov / Vadim Mukhin on 03.04.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class MainView: View {
    
    private let label: UILabel = {
        let view = UILabel()
        view.text = "Test"
        view.textColor = .black
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(label)
    }

    override func setupLayout() {
        super.setupLayout()
        
        label.centerXAnchor ~= centerXAnchor
        label.centerYAnchor ~= centerYAnchor
    }
}
