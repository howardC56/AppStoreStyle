//
//  FeaturedCell.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/29/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseIdentifier: String = "FeaturedCell"
    
    func configure(with app: App) {
        tagLine.text = app.tagline.uppercased()
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
    
    public lazy var tagLine: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()
    
    public lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    public lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
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
    
    public lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [separatorView, tagLine, name, subtitle, imageView])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(10, after: separatorView)
        stack.setCustomSpacing(10, after: subtitle)
        return stack
    }()
    
    private lazy var separatorView: UIView = {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        return separator
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
        addSubview(labelStack)
        NSLayoutConstraint.activate([labelStack.leadingAnchor.constraint(equalTo: leadingAnchor), labelStack.trailingAnchor.constraint(equalTo: trailingAnchor), labelStack.bottomAnchor.constraint(equalTo: bottomAnchor), labelStack.topAnchor.constraint(equalTo: topAnchor),
                                     separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
