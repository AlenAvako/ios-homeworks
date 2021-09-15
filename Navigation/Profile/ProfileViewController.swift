//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ален Авако on 10.09.2021.
//  Created by Ален Авако on 09.09.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    private var statusText: String = ""
    
    lazy var profileHV: ProfileHeaderView = {
        let profileView = ProfileHeaderView()

//        Mark: Profile image
        profileView.addSubview(profileView.profileImage)
        profileView.profileImage.image = UIImage(named: "Ava")
        profileView.profileImage.contentMode = .scaleAspectFill
        profileView.profileImage.clipsToBounds = true
        profileView.profileImage.frame = CGRect(origin: CGPoint(x: 16,
                                                                y: 16),
                                                size: CGSize(width: 120,
                                                             height: 120))
        profileView.profileImage.layer.borderColor = UIColor.white.cgColor
        profileView.profileImage.layer.borderWidth = 3
        profileView.profileImage.layer.cornerRadius = profileView.profileImage.bounds.height / 2
        
//        Mark: Name Label
        profileView.addSubview(profileView.nameLabel)
        profileView.nameLabel.text = "Clint Barton"
        profileView.nameLabel.font = UIFont.systemFont(ofSize: 18,
                                                       weight: .bold)
        profileView.nameLabel.textColor = .black
        profileView.nameLabel.frame = CGRect(origin: CGPoint(x: 170,
                                                             y: 27.0),
                                             size: CGSize(width: 120,
                                                          height: 20))
        
//        Mark: Status Label
        profileView.addSubview(profileView.statusLabel)
        profileView.statusLabel.font = UIFont.systemFont(ofSize: 14,
                                                         weight: .regular)
        profileView.statusLabel.textColor = .gray
        profileView.statusLabel.frame = CGRect(x: 170,
                                               y: 98,
                                               width: 200,
                                               height: 20)
        
//        Mark: Status button
        profileView.addSubview(profileView.getStatusButton)
        profileView.getStatusButton.addTarget(self,
                                              action: #selector(getStatus),
                                              for: .touchUpInside)
        profileView.getStatusButton.backgroundColor = .blue
        profileView.getStatusButton.setTitle("Set status", for: .normal)
        profileView.getStatusButton.frame = .init(x: 16,
                                                  y: 180,
                                            width: view.bounds.width - 32,
                                            height: 50)
        profileView.getStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileView.getStatusButton.layer.shadowRadius = 4
        profileView.getStatusButton.layer.shadowColor = UIColor.black.cgColor
        profileView.getStatusButton.layer.shadowOpacity = 0.7
        profileView.getStatusButton.layer.cornerRadius = 4
        
//        Mark: Add status text field
        profileView.addSubview(profileView.addStatus)
        profileView.addStatus.addTarget(self,
                                        action: #selector(statusTextChanged(_:)),
                                        for: .editingChanged)
        profileView.addStatus.delegate = self
        profileView.addStatus.backgroundColor = UIColor.white
        profileView.addStatus.textColor = UIColor.black
        profileView.addStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        profileView.addStatus.indent(size: 10)
        profileView.addStatus.frame = CGRect(x: 170,
                                             y: 124,
                                             width: view.frame.width / 2 + 32,
                                             height: 40)
        profileView.addStatus.layer.borderColor = UIColor.black.cgColor
        profileView.addStatus.layer.borderWidth = 1
        profileView.addStatus.layer.cornerRadius = 12
        
        
        
        return profileView
    }()

    @objc func getStatus() {
        profileHV.statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = profileHV.addStatus.text ?? ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        getStatus()
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(profileHV)
        

        }
    
    override func viewWillLayoutSubviews() {
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([profileHV.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                     profileHV.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                                     profileHV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     profileHV.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
