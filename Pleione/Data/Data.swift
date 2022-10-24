//
//  Data.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

struct Data {
    static let shared = Data()
    
    let question    = "butt"
    let answer      = "booty"
    
    let cards: [Card] = [Card(question: "What is the name of Saturn's largest moon?", answer: "Titan", familiarity: 1), Card(question: "Which one of Neptune's moons orbits it in the opposite direction?", answer: "Triton", familiarity: 1), Card(question: "Does Venus have a moon?", answer: "No", familiarity: 1)]
    
//    var 
}