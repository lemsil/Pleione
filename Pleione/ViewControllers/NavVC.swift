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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(mainVC, animated: false)
        
        mainVC.delegate     = self
        studyVC.delegate    = self
    }
}


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
