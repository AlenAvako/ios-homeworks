//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ален Авако on 10.09.2021.
//  Created by Ален Авако on 09.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
    }
    

        let view = (Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)![0])
        self.view.addSubview(view as! ProfileView)
    }

}
