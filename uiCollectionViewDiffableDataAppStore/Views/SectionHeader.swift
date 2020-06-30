//
//  SectionHeader.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/30/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
        static let reuseIdentifier = "SectionHeader"
    
    public lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()
    
    public lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    private lazy var separatorView: UIView = {
           let separator = UIView(frame: .zero)
           separator.translatesAutoresizingMaskIntoConstraints = false
           separator.backgroundColor = .quaternaryLabel
           return separator
       }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [separatorView, title, subtitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.setCustomSpacing(10, after: separatorView)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonSetup() {
        setupHeader()
    }
    
    private func setupHeader() {
        addSubview(stackView)
        NSLayoutConstraint.activate([separatorView.heightAnchor.constraint(equalToConstant: 1), stackView.leadingAnchor.constraint(equalTo: leadingAnchor), stackView.trailingAnchor.constraint(equalTo: trailingAnchor), stackView.topAnchor.constraint(equalTo: topAnchor), stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)])
    }
}
