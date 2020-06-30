//
//  MediumCell.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/30/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class MediumCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseIdentifier: String = "MediumCell"
    
    func configure(with app: App) {
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
    
    public lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return iv
    }()
    
    public lazy var buyButton: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
        b.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return b
    }()
    
    public lazy var innerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name, subtitle])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public lazy var outerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, innerStack, buyButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        labelStackSetup()
    }
    
    private func labelStackSetup() {
        contentView.addSubview(outerStack)
        NSLayoutConstraint.activate([outerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), outerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), outerStack.topAnchor.constraint(equalTo: contentView.topAnchor), outerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
