//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ален Авако on 14.09.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    
    

    let profileImage: UIImageView = {
       let profileImage = UIImageView()

        return profileImage
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        
        return name
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()

        return statusLabel
    }()
    
    
    let getStatusButton: UIButton = {
        let button = UIButton()

        return button
    }()
    
    let addStatus: UITextField = {
        let addStatus = UITextField()

        return addStatus
    }()
}
