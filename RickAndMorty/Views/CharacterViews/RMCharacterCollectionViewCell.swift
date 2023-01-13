//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alisher Djuraev on 12/01/23.
//

import UIKit
import SnapKit

/// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        self.setupLayer()
        self.setupCellUI()
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    private func setupCellUI() {
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(nameLabel.snp.top).offset(-3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalTo(self.contentView.snp.leading).offset(5)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-7)
            make.bottom.equalTo(statusLabel.snp.top)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalTo(self.contentView.snp.leading).offset(7)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-7)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterListViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
