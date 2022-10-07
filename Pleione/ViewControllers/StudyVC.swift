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
    
    let cardVC = CardVC()
    let returnButton = VVButton()
    let cardContainerView = UIView()
    
    weak var delegate: StudyVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        cardVC.delegate = self
        
        configureButtons()
        configureCardArea()
        
        
        print(cardContainerView.frame.width)
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
    
    func configureCardArea() {
        view.addSubview(cardContainerView)
        
        cardContainerView.backgroundColor = .systemBlue
        cardContainerView.layer.cornerRadius = 16
        
        cardContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 30
    
        NSLayoutConstraint.activate([
            cardContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            cardContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cardContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cardContainerView.bottomAnchor.constraint(equalTo: returnButton.topAnchor, constant: -padding)
        ])
            
        add(childVC: cardVC, to: self.cardContainerView)
        cardVC.configureButton(with: self.cardContainerView)
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}


extension StudyVC {
    @objc func returnButtonPressed() {
        print("return button was clicked")
        delegate?.returnButtonPressed()
    }
}


extension StudyVC: CardVCDelegate {
    func callToActionButtonPressed() {
        print("you clicked me")
        cardVC.view.backgroundColor = .systemBlue
        print(cardContainerView.bounds.width)
    }
}
