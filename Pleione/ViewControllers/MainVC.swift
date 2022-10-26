//
//  ViewController.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

protocol MainVCDelegate: AnyObject {
    func didPressStudyButton()
}

class MainVC: UIViewController {
    
    let padding: CGFloat = 60
    
    let readyLabel  = VVLabel()
    let studyButton = VVButton()
    let checkButton = VVButton()
    let studyContainerVC = StudyContainerVC()
    
    weak var delegate: MainVCDelegate?
    weak var studyDelegate: StudyContainerVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        checkReadyCards()
        configureReadyLabel()
        configureStudyButton()
        configureCheckButton()
    }
    
    
    func checkReadyCards() {
        var indexArray: [Int] = []
        
        for (index, card) in Data.shared.cards.enumerated() {
            if card.cooldown != nil {
                if Date() > card.cooldown! {
                    Data.shared.cards[index].cooldown = nil
                }
            }
            
            if card.cooldown == nil && card.studied != true {
                Data.shared.readyCards.append(Data.shared.cards[index])
                indexArray.append(index)
            }
        }
        
        indexArray = indexArray.reversed()
        for index in indexArray {
            Data.shared.cards.remove(at: index)
        }
        readyLabel.text = "\(Data.shared.readyCards.count)"
        
        
    }
}

// MARK: Buttons presses ---
extension MainVC {
    @objc func studyButtonClicked() {
        delegate?.didPressStudyButton()
    }
    
    @objc func checkButtonClicked() {
        checkReadyCards()
        
        studyDelegate?.resetStudyCards()
    }
}

// MARK: Configuration ---
extension MainVC {
    func configureReadyLabel() {
        view.addSubview(readyLabel)
        
        readyLabel.backgroundColor = .systemPurple
        
        readyLabelConstraints()
        checkReadyCards()
    }
    
    func configureStudyButton() {
        view.addSubview(studyButton)
        
        studyButton.setTitle("Begin studying", for: .normal)
        studyButton.addTarget(self, action: #selector(studyButtonClicked), for: .touchUpInside)
        
        studyButtonConstraints()
    }
    
    func configureCheckButton() {
        view.addSubview(checkButton)
        
        checkButton.setTitle("check readiness", for: .normal)
        checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        checkButton.backgroundColor = .systemPurple
        
        checkButtonConstraints()
    }
}

// MARK: Constraints ---
extension MainVC {
    func readyLabelConstraints() {
        NSLayoutConstraint.activate([
            readyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            readyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readyLabel.heightAnchor.constraint(equalToConstant: 50),
            readyLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func studyButtonConstraints() {
        NSLayoutConstraint.activate([
            studyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            studyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            studyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            studyButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func checkButtonConstraints() {
        NSLayoutConstraint.activate([
            checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            checkButton.topAnchor.constraint(equalTo: studyButton.bottomAnchor, constant: padding),
            checkButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
