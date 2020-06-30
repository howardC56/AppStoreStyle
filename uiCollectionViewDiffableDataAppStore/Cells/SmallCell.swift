//
//  SmallCell.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/30/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SmallCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseIdentifier: String = "Small Cell"
    
    func configure(with app: App) {
        name.text = app.name
        imageView.image = UIImage(named: app.image
        )
    }
    
    public lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, name])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupSmallCell()
    }
    
    private func setupSmallCell() {
        addSubview(stackView)
        NSLayoutConstraint.activate([stackView.trailingAnchor.constraint(equalTo: trailingAnchor), stackView.leadingAnchor.constraint(equalTo: leadingAnchor), stackView.topAnchor.constraint(equalTo: topAnchor), stackView.bottomAnchor.constraint(equalTo: bottomAnchor),])
    }
}
