//
//  VVObject.swift
//  Pleione
//
//  Created by Leroy van Vliet on 30/10/2022.
//

import UIKit

struct VVObject {
  var index:                  Int?
  var name:                   String
  
  var exploreView:            BodyView?
  var detailView:             BodyView?
  var scrollView:             UIScrollView?
  
  var introText:              String?
  var inDepthText:            String?
  
  var type:                   String?
  var mass:                   String?
  var size:                   String?
  var distance:               String?
  var numberOfMoons:          String?
  var surfaceTemp:            String?
  var lengthOfDay:            String?
  var atmosphereComposition:  String?
  var atmospherePressure:     String?
  var visitedByProbes:        String?
  var cards:                  [Card]?
}
