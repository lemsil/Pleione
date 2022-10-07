//
//  NavVC.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

class NavVC: UINavigationController {
    
    let mainVC = MainVC()
    let studyVC = StudyVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(mainVC, animated: false)
        
        mainVC.delegate = self
        studyVC.delegate = self
        
    }
}


extension NavVC: MainVCDelegate {
    func didPressStudyButton() {
        print("study button pressed")
        pushViewController(studyVC, animated: true)
    }
}


extension NavVC: StudyVCDelegate {
    func returnButtonPressed() {
        print("return button pressed")
        popViewController(animated: true)
    }
}
