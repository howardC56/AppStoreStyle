//
//  AppsView.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/29/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class AppsView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        cv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cv.backgroundColor = .systemBackground
        cv.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        cv.register(MediumCell.self, forCellWithReuseIdentifier: MediumCell.reuseIdentifier)
        cv.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
        cv.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        return cv
    }()
    
    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubview(collectionView)
    }
}
