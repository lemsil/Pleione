//
//  Card.swift
//  Pleione
//
//  Created by Leroy van Vliet on 22/10/2022.
//

import Foundation

struct Card {
    var question:       String
    var answer:         String
    var familiarity:    Int
    var studied:        Bool
    var ready:          Bool
    var checked:        Bool    = false
    var cooldown:       Date?
}
