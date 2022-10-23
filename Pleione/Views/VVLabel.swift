//
//  VVLabel.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

import UIKit

class VVLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        font                        = .systemFont(ofSize: 25)
        numberOfLines               = .zero
        textAlignment               = .center
        backgroundColor             = .systemGray3
        textColor                   = .label
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
