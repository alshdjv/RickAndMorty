//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Alisher Djuraev on 11/01/23.
//

import UIKit
import SnapKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {
    
    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Characters"
        
        self.setupControllerUI()
    }
    
    private func setupControllerUI() {
        self.view.addSubview(characterListView)
        characterListView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
   
}
