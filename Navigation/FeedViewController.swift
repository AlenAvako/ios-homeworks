//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ален Авако on 10.09.2021.
//

import UIKit

class FeedViewController: UIViewController {

    let button = UIButton()
    
    let post = Post(title: "Новости")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
        
        button.backgroundColor = UIColor(red: 0.75, green: 0.85, blue: 0.86, alpha: 1)
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 50)
        button.center = view.center
        button.setTitle("Новости", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func tap() {
        let postVC = PostViewController()
        postVC.postTitle = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
}
