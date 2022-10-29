//
//  NavVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

class NavVC: UINavigationController {
  
  let studyVC     = StudyVC()
  let mainVC      = MainVC()
  let exploreVC   = ExploreVC()
  let detailVC    = ExploreVC()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pushViewController(mainVC, animated: false)
    
    mainVC.delegate     = self
    studyVC.delegate    = self
  }
}

// MARK: Extensions ---
extension NavVC: MainVCDelegate {
  func didPressStudyButton() {
    pushViewController(studyVC, animated: true)
  }
  
  func didPressExploreButton() {
    pushViewController(exploreVC, animated: true)
  }
}

extension NavVC: StudyVCDelegate {
  func finishedStudying() {
    popViewController(animated: true)
  }
}

extension NavVC: ExploreVCDelegate {
  func didSelectBody() {
    pushViewController(detailVC, animated: true)
  }
}
