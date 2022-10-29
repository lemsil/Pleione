//
//  ExploreVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 27/10/2022.
//

import UIKit

protocol ExploreVCDelegate: AnyObject {
  func didSelectBody()
}

class ExploreVC: UIViewController {
  
  var bodyIndex       = 0
  let previousButton  = VVButton()
  let nextButton      = VVButton()
  
  var currentBodyView: BodyView?
  
  weak var delegate: ExploreVCDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGray3
    
    configureViews()
  }
  
  // MARK: Logic ---
  func goToDetailVC() {
    // navigate to detailVC of selected object
  }
  
  func switchOutOldBody(atIndex index: Int) {
    Data.shared.bodyViews[index].removeFromSuperview()
  }
  
  func switchInNewBody(atIndex index: Int) {
    view.addSubview(Data.shared.bodyViews[index])
    
    activateBodyConstraints(of: Data.shared.bodyViews[index])
  }
}

// MARK: Configuration ---
extension ExploreVC {
  func configureViews() {
    view.addSubview(previousButton)
    view.addSubview(nextButton)
    
    // prevButton
    previousButton.setTitle("Go up", for: .normal)
    previousButton.addTarget(self, action: #selector(prevButtonPressed), for: .touchUpInside)
    
    // nextButton
    nextButton.setTitle("Go down", for: .normal)
    nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    
    activateButtonConstraints()
    switchInNewBody(atIndex: bodyIndex)
  }
}

// MARK: Buttons ---
extension ExploreVC {
  @objc func prevButtonPressed() {
    if bodyIndex >= 1 {
      switchOutOldBody(atIndex: bodyIndex)
      
      bodyIndex -= 1
      
      switchInNewBody(atIndex: bodyIndex)
    }
  }
  
  @objc func nextButtonPressed() {
    if bodyIndex <= Data.shared.bodyViews.count - 2 {
      switchOutOldBody(atIndex: bodyIndex)
      
      bodyIndex += 1
      
      switchInNewBody(atIndex: bodyIndex)
    }
  }
}

// MARK: Constraints ---
extension ExploreVC {
  func activateButtonConstraints() {
    NSLayoutConstraint.activate([
      previousButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
      previousButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      previousButton.heightAnchor.constraint(equalToConstant: 60),
      previousButton.widthAnchor.constraint(equalToConstant: 200),
      
      nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.heightAnchor.constraint(equalToConstant: 60),
      nextButton.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  func activateBodyConstraints(of bodyView: BodyView) {
    NSLayoutConstraint.activate([
      bodyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      bodyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
}

