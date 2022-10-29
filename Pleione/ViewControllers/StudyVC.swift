//
//  StudyContainerView.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

import UIKit

protocol StudyVCDelegate: AnyObject {
  func finishedStudying()
}

class StudyVC: UIViewController {
  
  var cardIndex       = 0
  let mainVC          = MainVC()
  let countLabel      = VVLabel()
  let questionLabel   = VVLabel()
  let answerLabel     = VVLabel()
  let answerButton    = VVButton()
  let againButton     = VVButton()
  let successButton   = VVButton()
  let stackView       = UIStackView()
  
  weak var delegate: StudyVCDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray3
    
    configureItems()
    activateConstraints()
    setQuestionAndAnswerText()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if Data.shared.readyCards.count > 0 {
      resetCardViews()
      updateRemainingCards()
    }
  }
  
  func setQuestionAndAnswerText() {
    questionLabel.text  = Data.shared.readyCards[cardIndex].question
    answerLabel.text    = Data.shared.readyCards[cardIndex].answer
  }
  
  func resetCardViews() {
    questionLabel.text  = Data.shared.readyCards[cardIndex].question
    answerLabel.text    = Data.shared.readyCards[cardIndex].answer
    countLabel.alpha    = 1
    questionLabel.alpha = 1
    answerLabel.alpha   = 0
    answerButton.alpha  = 1
  }
  
  func moveToNextCard() {
    DispatchQueue.main.async {
      if Data.shared.readyCards.count > 0 {
        self.answerLabel.alpha = 0
        self.setQuestionAndAnswerText()
      } else {
        self.delegate?.finishedStudying()
      }
      
      self.answerButton.isHidden   = false
      self.stackView.isHidden      = true
    }
  }
  
  func updateRemainingCards() {
    self.countLabel.text = "\(Data.shared.readyCards.count)"
  }
}

// MARK: Configuration ---
extension StudyVC {
  func configureItems() {
    view.addSubview(countLabel)
    view.addSubview(questionLabel)
    view.addSubview(answerLabel)
    view.addSubview(answerButton)
    view.addSubview(stackView)
    
    // Labels
    updateRemainingCards()
    answerLabel.alpha       = 0
    
    // Answer button
    answerButton.setTitle("show answer", for: .normal)
    answerButton.addTarget(self, action: #selector(showAnswerButtonPressed), for: .touchUpInside)
    answerButton.alpha = 1
    
    // Again button
    againButton.setTitle("again", for: .normal)
    againButton.addTarget(self, action: #selector(againButtonPressed), for: .touchUpInside)
    againButton.backgroundColor = .systemPurple
    
    // Success button
    successButton.setTitle("correct", for: .normal)
    successButton.addTarget(self, action: #selector(successButtonPressed), for: .touchUpInside)
    successButton.backgroundColor = .systemBlue
    
    // Stack view
    stackView.axis          = .horizontal
    stackView.distribution  = .fillEqually
    stackView.spacing       = 10
    stackView.isHidden      = true
    
    stackView.addArrangedSubview(againButton)
    stackView.addArrangedSubview(successButton)
    stackView.translatesAutoresizingMaskIntoConstraints = false
  }
}

// MARK: Button presses ---
extension StudyVC {
  @objc func showAnswerButtonPressed() {
    DispatchQueue.main.async {
      self.answerButton.isHidden   = true
      self.stackView.isHidden      = false
      
      self.answerLabel.alpha = 1
    }
  }
  
  @objc func againButtonPressed() {
    self.answerButton.isHidden   = false
    self.stackView.isHidden      = true
    
    Data.shared.readyCards[cardIndex].familiarity    = 0
    Data.shared.readyCards[cardIndex].cooldown       = nil
    
    Data.shared.readyCards.append(Data.shared.readyCards[cardIndex])
    Data.shared.readyCards.remove(at: cardIndex)
    
    moveToNextCard()
  }
  
  @objc func successButtonPressed() {
    self.answerButton.isHidden  = false
    self.stackView.isHidden     = true
    
    if Data.shared.readyCards[cardIndex].familiarity < 5 {
      Data.shared.readyCards[cardIndex].familiarity    += 1
    }
    
    switch Data.shared.readyCards[cardIndex].familiarity {
    case 0:
      Data.shared.readyCards[cardIndex].cooldown = nil
    case 1:
      Data.shared.readyCards[cardIndex].cooldown = Date(timeIntervalSinceNow: 3)
    case 2:
      Data.shared.readyCards[cardIndex].cooldown = Date(timeIntervalSinceNow: 6)
    case 3:
      Data.shared.readyCards[cardIndex].cooldown = Date(timeIntervalSinceNow: 9)
    case 4:
      Data.shared.readyCards[cardIndex].cooldown = Date(timeIntervalSinceNow: 12)
    case 5:
      Data.shared.readyCards[cardIndex].cooldown = Date(timeIntervalSinceNow: 15)
    default:
      Data.shared.readyCards[cardIndex].cooldown = nil
    }
    
    Data.shared.cards.append(Data.shared.readyCards[cardIndex])
    Data.shared.readyCards.remove(at: cardIndex)
    
    updateRemainingCards()
    
    moveToNextCard()
  }
}


// MARK: Constraints ---
extension StudyVC {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      countLabel.heightAnchor.constraint(equalToConstant: 100),
      
      questionLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 50),
      questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      questionLabel.heightAnchor.constraint(equalToConstant: 100),
      
      answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
      answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      answerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      answerLabel.heightAnchor.constraint(equalToConstant: 200),
      
      answerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
      answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      answerButton.widthAnchor.constraint(equalToConstant: 200),
      answerButton.heightAnchor.constraint(equalToConstant: 50),
      
      stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      stackView.heightAnchor.constraint(equalToConstant: 50),
    ])
  }
}
