//
//  Data.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

struct Data {
  static var shared = Data()
  
  var cards: [Card] = [
    Card(question: "What is the name of Saturn's largest moon?", answer: "Titan", familiarity: 0, cooldown: nil),
    Card(question: "Which one of Neptune's moons orbits it in the opposite direction?", answer: "Triton", familiarity: 0, cooldown: nil),
    Card(question: "Does Venus have a moon?", answer: "No", familiarity: 0, cooldown: nil)
  ]
  
  var readyCards: [Card] = []
  
  let bodyViews: [BodyView] = [
    BodyView(85,  .systemGray),
    BodyView(160, .systemYellow),
    BodyView(160, .systemGreen),
    BodyView(110, .systemRed),
    BodyView(250, .systemOrange),
    BodyView(225, .systemBrown),
    BodyView(190, .systemTeal),
    BodyView(200, .systemCyan)
  ]
}
