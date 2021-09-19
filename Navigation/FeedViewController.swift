//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ален Авако on 10.09.2021.
//

import UIKit

class FeedViewController: UIViewController {

    let buttonToPostView = UIButton()
    let newButtonToPostView = UIButton()
    
    let post = Post(title: "Новости")
    
    let stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        
        configureStackView()
    }
    
//    MARK: configure
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        setStackViewConstraint()
        addButtonToStackView()
    }
    
    func configurePostViewButton() {
        buttonToPostView.backgroundColor = UIColor(named: "appBlue")
        buttonToPostView.setTitle("Новости", for: .normal)
        buttonToPostView.addTarget(self, action: #selector(tap), for: .touchUpInside)
        buttonToPostView.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonToPostView.layer.shadowRadius = 4
        buttonToPostView.layer.shadowColor = UIColor.black.cgColor
        buttonToPostView.layer.shadowOpacity = 0.7
        buttonToPostView.layer.cornerRadius = 4
        
        newButtonToPostView.backgroundColor = UIColor(named: "appBlue")
        newButtonToPostView.setTitle("Что нового", for: .normal)
        newButtonToPostView.addTarget(self, action: #selector(tapNewToPostView), for: .touchUpInside)
        newButtonToPostView.layer.shadowOffset = CGSize(width: 4, height: 4)
        newButtonToPostView.layer.shadowRadius = 4
        newButtonToPostView.layer.shadowColor = UIColor.black.cgColor
        newButtonToPostView.layer.shadowOpacity = 0.7
        newButtonToPostView.layer.cornerRadius = 4
        
        setButtonsConstraints()
    }
    
    func addButtonToStackView() {
        stackView.addArrangedSubview(buttonToPostView)
        stackView.addArrangedSubview(newButtonToPostView)
        
        configurePostViewButton()
    }
//    MARK: constraints
    func setStackViewConstraint() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

        ])
    }
    
    func setButtonsConstraints() {
        buttonToPostView.translatesAutoresizingMaskIntoConstraints = false
        newButtonToPostView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buttonToPostView.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonToPostView.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonToPostView.heightAnchor.constraint(equalToConstant: 50),

            newButtonToPostView.leadingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            newButtonToPostView.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            newButtonToPostView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
//    MARK: objc func
    @objc func tap() {
        let postVC = PostViewController()
        postVC.postTitle = buttonToPostView.title(for: .normal)
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    @objc func tapNewToPostView() {
        let postVC = PostViewController()
        postVC.postTitle = newButtonToPostView.title(for: .normal)
        navigationController?.pushViewController(postVC, animated: true)
    }
}

class PostViewBotton: UIButton {
    
}
