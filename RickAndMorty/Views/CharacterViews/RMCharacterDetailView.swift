//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Alisher Djuraev on 13/01/23.
//

import UIKit
import SnapKit

/// View for single character info
final class RMCharacterDetailView: UIView {
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.backgroundColor = .systemPurple
        
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        self.addSubviews(collectionView, spinner)
        self.setupUI()
    }
    
    private func setupUI() {
        
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        
        guard let collectionView = collectionView else {
            return
        }
        
        spinner.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.centerX.centerY.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }
    
    private func createSection(for sectionIndex: Index) -> NSCollectionLayoutSection {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
