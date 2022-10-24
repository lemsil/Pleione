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
    let compareButton = VVButton()
    var date1       = Date()
    var date2       = Date()
    
    weak var delegate: MainVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray
        
        setDates()
        configureStudyButton()
        configureCompareButton()
    }

    func setDates() {
        date1 = Date()
        date2 = Date(timeIntervalSinceNow: 5)
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
    
    
    func configureCompareButton() {
        view.addSubview(compareButton)
        
        let padding: CGFloat = 60
        
        compareButton.setTitle("compare times", for: .normal)
        compareButton.addTarget(self, action: #selector(compareButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            compareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            compareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            compareButton.topAnchor.constraint(equalTo: studyButton.bottomAnchor, constant: padding),
            compareButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}


extension MainVC {
    @objc func studyButtonClicked() {
        delegate?.didPressStudyButton()
    }
    
    @objc func compareButtonClicked() {
        print("\(Date() > date2)")
    }
}


extension MainVC {
    func initializeDates() {
        
    }
    
    func compareDates() {
        
    }
}
