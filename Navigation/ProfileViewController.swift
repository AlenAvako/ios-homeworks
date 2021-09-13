//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ален Авако on 09.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = (Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)![0])
        self.view.addSubview(view as! ProfileView)
    }
}
