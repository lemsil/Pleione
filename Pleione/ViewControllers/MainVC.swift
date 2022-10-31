//
//  ViewController.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

protocol MainVCDelegate: AnyObject {
  func didPressStudyButton()
  func didPressExploreButton()
}

class MainVC: UIViewController {
  
  var hasCardsToStudy: Bool?
  
  let padding: CGFloat    = 60
  
  let stackView           = UIStackView()
  let readyLabel          = VVLabel()
  let exploreButton       = VVButton()
  let studyButton         = VVButton()
  
  weak var delegate: MainVCDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray3
    
    checkReadyCards()
    configureReadyLabel()
    configureExploreButton()
    configureStudyButton()
    configureStackView()
    
    initializeSSOArray()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    checkReadyCards()
    
    let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
  }
  
  // MARK: Logic ---
  func checkReadyCards() {
    var indexArray: [Int] = []
    
    for (index, card) in Data.shared.cards.enumerated() {
      if card.cooldown != nil {
        if Date() > card.cooldown! {
          Data.shared.cards[index].cooldown = nil
        }
      }
      
      if card.cooldown == nil && card.added == true {
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
      studyButton.isEnabled       = true
      
      studyButton.setTitle("Study", for: .normal)
    } else {
      studyButton.backgroundColor = .systemGray
      studyButton.isEnabled       = false
      
      studyButton.setTitle("You're done studying for now!", for: .disabled)
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
  @objc func exploreButtonClicked() {
    delegate?.didPressExploreButton()
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
  
  func configureExploreButton() {
    exploreButton.setTitle("Explore", for: .normal)
    exploreButton.addTarget(self, action: #selector(exploreButtonClicked), for: .touchUpInside)
  }
  
  func configureStudyButton() {
    studyButton.setTitle("Study", for: .normal)
    studyButton.addTarget(self, action: #selector(studyButtonClicked), for: .touchUpInside)
  }
  
  func configureStackView() {
    view.addSubview(stackView)
    
    stackView.axis          = .vertical
    stackView.distribution  = .fillEqually
    stackView.spacing       = 20
    
    stackView.addArrangedSubview(exploreButton)
    stackView.addArrangedSubview(studyButton)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackViewConstraints()
  }
}

// MARK: Constraints ---
extension MainVC {
  func readyLabelConstraints() {
    NSLayoutConstraint.activate([
      readyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
      readyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      readyLabel.heightAnchor.constraint(equalToConstant: 50),
      readyLabel.widthAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  func stackViewConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
      stackView.heightAnchor.constraint(equalToConstant: 140)
    ])
  }
}

// MARK: Initialize Array ---
extension MainVC {
  func initializeSSOArray() {
    Data.shared.planetsAndStructures = [
      Data.shared.mercury,
      Data.shared.venus,
      Data.shared.earth,
      Data.shared.mars,
      Data.shared.jupiter,
      Data.shared.saturn,
      Data.shared.uranus,
      Data.shared.neptune
    ]
    
    Data.shared.moonCatalogue["Earth"] = [Data.shared.moon]
    Data.shared.moonCatalogue["Mars"] = [Data.shared.phobos, Data.shared.deimos]
    Data.shared.moonCatalogue["Jupiter"] = [Data.shared.io, Data.shared.europa, Data.shared.ganymede, Data.shared.callisto]
    Data.shared.moonCatalogue["Saturn"] = [Data.shared.mimas, Data.shared.enceladus, Data.shared.tethys, Data.shared.dione, Data.shared.rhea, Data.shared.rhea, Data.shared.titan, Data.shared.iapetus]
    Data.shared.moonCatalogue["Uranus"] = [Data.shared.miranda, Data.shared.ariel, Data.shared.umbriel, Data.shared.titania, Data.shared.oberon]
    Data.shared.moonCatalogue["Neptune"] = [Data.shared.triton]
  }
}
