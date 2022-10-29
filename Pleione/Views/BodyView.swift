//
//  VVView.swift
//  Pleione
//
//  Created by Leroy van Vliet on 28/10/2022.
//

import UIKit
class BodyView: UIView {
  override init(frame: CGRect) {
    
    bodySize = 1
    
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  init(_ size: Int, _ color: UIColor) {
    bodySize = size
    
    super.init(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
  
    backgroundColor     = color
    layer.cornerRadius  = CGFloat(size / 2)
    
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  var bodySize: Int
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: bodySize, height: bodySize)
  }
}
