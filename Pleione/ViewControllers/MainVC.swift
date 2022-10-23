//
//  ViewController.swift
//  Pleione
//
//  Created by Leroy van Vliet on 07/10/2022.
//

import UIKit

protocol MainVCDelegate: AnyObject {
    func didPressStudyButton()
}

class MainVC: UIViewController {

    let studyButton = VVButton()
    
    weak var delegate: MainVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray
        
        configureStudyButton()
    }

    func configureStudyButton() {
        view.addSubview(studyButton)
        
        let padding: CGFloat = 60
        
        studyButton.setTitle("Begin studying", for: .normal)
        studyButton.addTarget(self, action: #selector(studyButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            studyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            studyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            studyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            studyButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


extension MainVC {
    @objc func studyButtonClicked() {
        print("study button was clicked")
        delegate?.didPressStudyButton()
    }
}
