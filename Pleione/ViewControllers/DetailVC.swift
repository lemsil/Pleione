//
//  DetailVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 29/10/2022.
//

import UIKit

class DetailVC: UIViewController {
  
//  let headerBody = BodyView("Mercury", .systemPink)
//  let headerBody = Data.shared.detailBodyViews[0]
  var headerBody: BodyView?
  var bodyIndex: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGray6
    
    headerBody = Data.shared.detailBodyViews[bodyIndex!]
    headerBody!.layer.cornerRadius = 100
    view.addSubview(headerBody!)
    
    activateHeaderConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    headerBody = Data.shared.detailBodyViews[bodyIndex!]
    headerBody!.layer.cornerRadius = 100
    view.addSubview(headerBody!)
    
    activateHeaderConstraints()
  }
}

// MARK: Constraints ---
extension DetailVC {
  func activateHeaderConstraints() {
    NSLayoutConstraint.activate([
      headerBody!.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      headerBody!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      headerBody!.heightAnchor.constraint(equalToConstant: 200),
      headerBody!.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
}
