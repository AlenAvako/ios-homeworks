//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ален Авако on 14.09.2021.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private var statusText: String = ""
    
    override func layoutSubviews() {
        
    }
    //        MARK: Profile image
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = #imageLiteral(resourceName: "Ava")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.layer.cornerRadius = 60
        profileImage.clipsToBounds = true
        return profileImage
    }()
    //        MARK: Status button
    lazy var getStatusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self,
                         action: #selector(getStatus),
                         for: .touchUpInside)
        button.backgroundColor = UIColor(named: "appBlue")
        button.setTitle("Set status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        return button
    }()
    //        MARK: Status Label
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Clint Barton"
        name.font = UIFont.systemFont(ofSize: 18,
                                      weight: .bold)
        name.textColor = .black
        return name
    }()
    //        MARK: Add status text field
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something"
        statusLabel.font = UIFont.systemFont(ofSize: 14,
                                             weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()
    //        MARK: Add status text field
    lazy var addStatus: UITextField = {
        let addStatus = UITextField()
        addStatus.addTarget(self,
                            action: #selector(statusTextChanged(_:)),
                            for: .editingChanged)
        addStatus.backgroundColor = UIColor.white
        addStatus.textColor = UIColor.black
        addStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        addStatus.indent(size: 10)
        addStatus.layer.borderColor = UIColor.black.cgColor
        addStatus.layer.borderWidth = 1
        addStatus.layer.cornerRadius = 12
        return addStatus
    }()
    
    private func setUpConstraints() {
        
        guard let superView = superview else { return }
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        getStatusButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        addStatus.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            
            getStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            getStatusButton.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            getStatusButton.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            getStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            statusLabel.bottomAnchor.constraint(equalTo: getStatusButton.topAnchor , constant: -60),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 14),
            
            addStatus.bottomAnchor.constraint(equalTo: getStatusButton.topAnchor , constant: -10),
            addStatus.leadingAnchor.constraint(equalTo: profileImage.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            addStatus.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addStatus.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func addView() {
        addStatus.delegate = self
        addSubviews(profileImage, getStatusButton, nameLabel, statusLabel, addStatus)
        self.setUpConstraints()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
// MARK: objc funcs
    @objc private func getStatus() {
        statusLabel.text = statusText
        addStatus.resignFirstResponder()
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
//        statusText = addStatus.text ?? ""
        guard let text = textField.text else { return }
        statusText = text
    }
}
// MARK: Extensions
public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

