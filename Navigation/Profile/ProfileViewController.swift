//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ален Авако on 10.09.2021.
//  Created by Ален Авако on 09.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy private(set) var profileHV = ProfileHeaderView()
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(profileHV)
        profileHV.backgroundColor = UIColor.lightGray
        profileHV.layer.shadowRadius = 10
        profileHV.layer.shadowColor = UIColor.black.cgColor
        profileHV.layer.shadowOpacity = 0.7
        profileHV.layer.cornerRadius = 4
        profileHV.addView()
        
        view.addSubview(button)
        button.setTitle("button", for: .normal)
        }
    
    override func viewWillLayoutSubviews() {
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([profileHV.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     profileHV.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                                     profileHV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     profileHV.heightAnchor.constraint(equalToConstant: 220),
        
                                     button.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     button.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                                     button.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

