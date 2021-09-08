//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Ален Авако on 04.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let profileView = (Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)![0])
        self.view.addSubview(profileView as! ProfileView)
    }
    

}
