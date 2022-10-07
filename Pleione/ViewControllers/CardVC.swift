//
//  CardVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

protocol CardVCDelegate: AnyObject {
    func callToActionButtonPressed()
}

class CardVC: UIViewController {
    
    let testButton = VVButton()
    
    weak var delegate: CardVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 16
    }
    
    
    func configureButton(with containerView: UIView) {
        view.addSubview(testButton)
        
        testButton.setTitle("Click me", for: .normal)
        testButton.addTarget(self, action: #selector(didPressCallToActionButton), for: .touchUpInside)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            testButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            testButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            testButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            testButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        print(containerView.bounds)
    }
}


extension CardVC {
    @objc func didPressCallToActionButton() {
        delegate?.callToActionButtonPressed()
    }
}
