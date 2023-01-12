//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Alisher Djuraev on 12/01/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
