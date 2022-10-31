//
//  VVView.swift
//  Pleione
//
//  Created by Leroy van Vliet on 28/10/2022.
//

import UIKit
class BodyView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(colored color: UIColor) {
    
    super.init(frame: .zero)
    
    backgroundColor     = color
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
