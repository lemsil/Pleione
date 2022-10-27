//
//  NavVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

class NavVC: UINavigationController {
    
    let studyContainerVC = StudyContainerVC()
    let mainVC      = MainVC()
    let studyVC     = StudyVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(mainVC, animated: false)
        
        mainVC.delegate             = self
        studyVC.delegate            = self
        studyContainerVC.delegate   = self
    }
}


extension NavVC: MainVCDelegate {
    func didPressStudyButton() {
        // if there are cards, do something here or if there aren't dont do anything
        pushViewController(studyContainerVC, animated: true)
    }
}


extension NavVC: StudyVCDelegate {
    func returnButtonPressed() {
        popViewController(animated: true)
    }
}


extension NavVC: StudyContainerVCDelegate {
    func finishedStudying() {
        popViewController(animated: true)
    }
}
