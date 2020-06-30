//
//  ViewController.swift
//  uiCollectionViewDiffableDataAppStore
//
//  Created by Howard Chang on 6/29/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController {
    let sections = Bundle.main.decode([Section].self, from: "appData.json")
    let appsView = AppsView()
    var dataSource: UICollectionViewDiffableDataSource<Section, App>?
    
    override func loadView() {
        view = appsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataSource(collectionView: appsView.collectionView)
        reloadData()
        appsView.collectionView.collectionViewLayout = createCompositionalLayout()
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        appsView.collectionView.delegate = self
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: App, for indexPath: IndexPath) -> T {
        guard let cell = appsView.collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else { fatalError("unable to dequeue \(cellType)") }
        cell.configure(with: app)
        return cell
    }
    
    func createDataSource(collectionView: UICollectionView) {
        dataSource = UICollectionViewDiffableDataSource<Section, App>(collectionView: collectionView) { (collectionView, indexPath, app) in
            switch self.sections[indexPath.section].type {
            case "mediumTable":
                return self.configure(MediumCell.self, with: app, for: indexPath)
            case "smallTable":
                return self.configure(SmallCell.self, with: app, for: indexPath)
            default:
                return self.configure(FeaturedCell.self, with: app, for: indexPath)
            }
        }
        dataSource?.supplementaryViewProvider = { [weak self]
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else { fatalError("Section Header failed to load") }
            guard let firstApp = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp) else { return nil }
            if section.title.isEmpty { print("title") }
            sectionHeader.title.text = section.title
            sectionHeader.subtitle.text = section.subtitle
            return sectionHeader
        }
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]
            switch section.type {
            case "mediumTable":
                return CollectionViewLayout.manager.createMediumTableSection(using: section)
            case "smallTable":
                return CollectionViewLayout.manager.createSmallTableSection(using: section)
            default:
                return CollectionViewLayout.manager.createFeaturedSection(using: section)
            }
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        layout.configuration = configuration
        return layout
    }

}

extension AppsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selected = dataSource?.itemIdentifier(for: indexPath) else { return }
        print(selected)
    }
}

