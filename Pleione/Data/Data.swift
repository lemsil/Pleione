//
//  Data.swift
//  Pleione
//
//  Created by Leroy van Vliet on 21/10/2022.
//

struct Data {
  static var shared = Data()
  
  // MARK: Cards ---
  var cards: [Card] = [
    Card(question: "What is the name of Saturn's largest moon?", answer: "Titan", familiarity: 0, cooldown: nil, cardIndex: 0, added: true),
    Card(question: "Which one of Neptune's moons orbits it in the opposite direction?", answer: "Triton", familiarity: 0, cooldown: nil, cardIndex: 1, added: true),
    Card(question: "Does Venus have a moon?", answer: "No", familiarity: 0, cooldown: nil, cardIndex: 2, added: true)
  ]
  
  var readyCards: [Card] = []
  
  // MARK: Planets ---
  var mercury = VVObject(
    name: "Mercury",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var venus   = VVObject(
    name: "Venus",
    exploreView: BodyView(colored: .systemYellow),
    detailView: BodyView(colored: .systemYellow)
  )
  
  var earth   = VVObject(
    name: "Earth",
    exploreView: BodyView(colored: .systemGreen),
    detailView: BodyView(colored: .systemGreen)
  )
  
  var mars    = VVObject(
    name: "Mars",
    exploreView: BodyView(colored: .systemRed),
    detailView: BodyView(colored: .systemRed)

  )
  var jupiter = VVObject(
    name: "Jupiter",
    exploreView: BodyView(colored: .systemOrange),
    detailView: BodyView(colored: .systemOrange)

  )
  var saturn  = VVObject(
    name: "Saturn",
    exploreView: BodyView(colored: .systemBrown),
    detailView: BodyView(colored: .systemBrown)
  )

  var uranus  = VVObject(
    name: "Uranus",
    exploreView: BodyView(colored: .systemTeal),
    detailView: BodyView(colored: .systemTeal)
  )
  
  var neptune = VVObject(
    name: "Neptune",
    exploreView: BodyView(colored: .systemCyan),
    detailView: BodyView(colored: .systemCyan)
  )
  
  // MARK: Moons ---
  var moon = VVObject(
    name: "Moon",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var phobos = VVObject(
    name: "Phobos",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var deimos = VVObject(
    name: "Deimos",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var io = VVObject(
    name: "Io",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var europa = VVObject(
    name: "Europa",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var ganymede = VVObject(
    name: "Ganymede",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var callisto = VVObject(
    name: "Callisto",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var mimas = VVObject(
    name: "Mimas",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var enceladus = VVObject(
    name: "Enceladus",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var tethys = VVObject(
    name: "Tethys",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var dione = VVObject(
    name: "Dione",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var rhea = VVObject(
    name: "Rhea",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var titan = VVObject(
    name: "Titan",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var iapetus = VVObject(
    name: "Iapetus",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var miranda = VVObject(
    name: "Miranda",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var ariel = VVObject(
    name: "Ariel",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var umbriel = VVObject(
    name: "Umbriel",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var titania = VVObject(
    name: "Titania",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var oberon = VVObject(
    name: "Oberon",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  var triton = VVObject(
    name: "Triton",
    exploreView: BodyView(colored: .systemGray),
    detailView: BodyView(colored: .systemGray)
  )
  
  
  var planetsAndStructures: [VVObject] = []
  
  var moonCatalogue: [String: [VVObject]] = [:]
}
