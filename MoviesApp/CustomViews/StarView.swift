//
//  StarView.swift
//  MoviesApp
//
//  Created by Arpit Dixit on 08/07/21.
//

import Foundation
import UIKit

class StarView: UIView {
    
    var selected: Bool = false {
        didSet {
            self.imageView.image = UIImage(systemName: selected ? "star.fill" : "star")
        }
    }
    
    private var imageView: UIImageView!
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        imageView = UIImageView(frame: self.frame)
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        imageView.addGestureRecognizer(tapGesture)
        self.addSubview(imageView)
    }
    
    @objc private func tapped() {
        selected.toggle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}
