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
    
    let showAnswerButton = VVButton()
    
    weak var delegate: CardVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 16
    }
    
}


extension CardVC {
    @objc func didPressCallToActionButton() {
        delegate?.callToActionButtonPressed()
    }
}
