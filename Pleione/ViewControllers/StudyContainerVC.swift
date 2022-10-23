//
//  StudyContainerView.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

import UIKit

class StudyContainerVC: UIViewController {
    
    var cardIndex       = 0
    
    let countLabel      = VVLabel()
    let questionLabel   = VVLabel()
    let answerLabel     = VVLabel()
    let doneLabel       = VVLabel()
    let answerButton    = VVButton()
    let againButton     = VVButton()
    let successButton   = VVButton()
    let stackView       = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        configureItems()
        configureStackView()
        activateConstraints()
        setQuestionAndAnswerText()
    }
    
    func configureItems() {
        view.addSubview(countLabel)
        view.addSubview(questionLabel)
        view.addSubview(answerLabel)
        view.addSubview(doneLabel)
        view.addSubview(answerButton)
        view.addSubview(againButton)
        view.addSubview(successButton)
        view.addSubview(stackView)
        
        againButton.setTitle("again", for: .normal)
        successButton.setTitle("correct", for: .normal)
        againButton.backgroundColor = .systemPurple
        successButton.backgroundColor = .systemBlue
        
        countLabel.text         = "5"
        doneLabel.text          = "You finished studying for now!"
        doneLabel.textAlignment = .center
        answerButton.setTitle("show answer", for: .normal)
        answerButton.addTarget(self, action: #selector(showAnswerButtonPressed), for: .touchUpInside)
//        answerButton.isUserInteractionEnabled = false
        
        doneLabel.alpha         = 0
        answerLabel.alpha       = 0
    }
    
    func setQuestionAndAnswerText() {
        questionLabel.text  = Data.shared.cards[cardIndex].question
        answerLabel.text    = Data.shared.cards[cardIndex].answer
    }
    
    @objc func showAnswerButtonPressed() {
        DispatchQueue.main.async {
            self.answerLabel.alpha = 1
            self.answerButton.setTitle("next card", for: .normal)
            self.answerButton.removeTarget(nil, action: nil, for: .allEvents)
            self.answerButton.addTarget(self, action: #selector(self.showNextCardButtonPressed), for: .touchUpInside)
        }
    }
    
    func configureStackView() {
        stackView.axis              = .horizontal
        stackView.distribution      = .fillEqually
        stackView.spacing           = 10
//        stackView.backgroundColor   = .systemRed
        
        stackView.addArrangedSubview(againButton)
        stackView.addArrangedSubview(successButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func showNextCardButtonPressed() {
        DispatchQueue.main.async {
           
            print("next card button pressed")
            
            if (self.cardIndex < Data.shared.cards.count - 1) {
                print(self.cardIndex)
                self.answerLabel.alpha = 0
                self.answerButton.setTitle("show answer", for: .normal)
                self.answerButton.removeTarget(nil, action: nil, for: .allEvents)
                self.answerButton.addTarget(self, action: #selector(self.showAnswerButtonPressed), for: .touchUpInside)
                self.cardIndex += 1
                self.setQuestionAndAnswerText()
            } else if (self.cardIndex == Data.shared.cards.count - 1) {
                print(self.cardIndex)
                self.showFinishedStudyingMessage()
            }
        }
    }
    
    func showFinishedStudyingMessage() {
        DispatchQueue.main.async {
            self.countLabel.alpha       = 0
            self.questionLabel.alpha    = 0
            self.answerLabel.alpha      = 0
            self.answerButton.alpha     = 0
            
            self.doneLabel.alpha        = 1
        }
    }
}


extension StudyContainerVC {
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
            
            doneLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            doneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            doneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            doneLabel.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
