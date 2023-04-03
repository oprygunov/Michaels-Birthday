//
//  View.swift
//  CoffeeShop
//
//  Created by Michael Golubev on 06.12.2022.
//

import UIKit

open class View: UIView {
    open func setupContent() {
        // add subviews
    }

    open func setupLayout() {
        // add constraints
    }

    public init() {
        super.init(frame: .zero)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupContent()
        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        setupLayout()
    }
}
