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
    var hasCardsToStudy: Bool?
    
    let readyLabel  = VVLabel()
    let studyButton = VVButton()
    
    weak var delegate: MainVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        checkReadyCards()
        configureReadyLabel()
        configureStudyButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkReadyCards()
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    func checkReadyCards() {
        var indexArray: [Int] = []
        
        for (index, card) in Data.shared.cards.enumerated() {
            if card.cooldown != nil {
                if Date() > card.cooldown! {
                    Data.shared.cards[index].cooldown = nil
                }
            }
            
            if card.cooldown == nil {
                Data.shared.readyCards.append(Data.shared.cards[index])
                indexArray.append(index)
            }
        }
        
        indexArray = indexArray.reversed()
        for index in indexArray {
            Data.shared.cards.remove(at: index)
        }
        readyLabel.text = "\(Data.shared.readyCards.count)"
        
        if Data.shared.readyCards.count > 0 {
            hasCardsToStudy = true
            toggleButtonState(when: hasCardsToStudy!)
        } else {
            hasCardsToStudy = false
            toggleButtonState(when: hasCardsToStudy!)
        }
    }
    
    func toggleButtonState(when State: Bool) {
        if State {
            studyButton.backgroundColor = .systemGreen
            studyButton.setTitle("begin studying", for: .normal)
            studyButton.isEnabled = true
        } else {
            studyButton.backgroundColor = .systemGray4
            studyButton.setTitle("no cards to study!", for: .disabled)
            studyButton.isEnabled = false
        }
    }
    
    @objc func handleTimer() {
        checkReadyCards()
    }
}

// MARK: Buttons presses ---
extension MainVC {
    @objc func studyButtonClicked() {
        delegate?.didPressStudyButton()
    }
}

// MARK: Configuration ---
extension MainVC {
    func configureReadyLabel() {
        view.addSubview(readyLabel)
        
        readyLabel.font = .systemFont(ofSize: 50)
        
        readyLabelConstraints()
        checkReadyCards()
    }
    
    func configureStudyButton() {
        view.addSubview(studyButton)
        
        studyButton.setTitle("Begin studying", for: .normal)
        studyButton.addTarget(self, action: #selector(studyButtonClicked), for: .touchUpInside)
        
        studyButtonConstraints()
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
}
