//
//  Data.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

struct Data {
    static var shared = Data()
//    let cards: [Card] = [Card(question: "What is the name of Saturn's largest moon?", answer: "Titan", familiarity: 1), Card(question: "Which one of Neptune's moons orbits it in the opposite direction?", answer: "Triton", familiarity: 1), Card(question: "Does Venus have a moon?", answer: "No", familiarity: 1)]
    
    var cards: [Card] = [Card(question: "butt", answer: "booty", familiarity: 0, cooldown: nil), Card(question: "booba", answer: "butts", familiarity: 0, cooldown: nil)]
    var readyCards: [Card] = []
}
