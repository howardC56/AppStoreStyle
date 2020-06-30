//
//  SelfConfiguringCell.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/29/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with app: App)
}
