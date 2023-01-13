//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Alisher Djuraev on 13/01/23.
//

import UIKit
import SnapKit

final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.setupFooterUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupFooterUI() {
        self.addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
}
