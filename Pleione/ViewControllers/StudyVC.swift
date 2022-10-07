//
//  StudyVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

protocol StudyVCDelegate: AnyObject {
    func returnButtonPressed()
}

class StudyVC: UIViewController {
    
    let returnButton = VVButton()
    
    weak var delegate: StudyVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        configureButtons()
    }
    
    func configureButtons() {
        view.addSubview(returnButton)
        
        let padding: CGFloat = 60
        
        returnButton.setTitle("Back to main", for: .normal)
        returnButton.addTarget(self, action: #selector(returnButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            returnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            returnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            returnButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


extension StudyVC {
    @objc func returnButtonPressed() {
        print("return button was clicked")
        delegate?.returnButtonPressed()
    }
}
