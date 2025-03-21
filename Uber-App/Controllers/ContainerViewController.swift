//
//  ContainerViewController.swift
//  Uber-App
//
//  Created by Sabri Çetin on 19.03.2025.
//

import UIKit
import FirebaseAuth

class ContainerViewController: UIViewController {
    
    
    private let homeController = HomeViewController()
    private var user: User? {
        didSet {
            guard let user = user else { return }
            homeController.user = user
            
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     //   checkIfUserIsLoggedIn()
       presentLoginController()
        
    }
    
    func checkIfUserIsLoggedIn() {

        if Auth.auth().currentUser?.uid == nil {
            presentLoginController()
        } else {
            configure()
            
        }
        
        
    }
    
    func presentLoginController() {
        DispatchQueue.main.async {
            let nav = UINavigationController(rootViewController: LoginViewController())
            self.isModalInPresentation = true
            self.present(nav, animated: true)
        }
    }
    
    func configure() {
        view.backgroundColor = .backgroundColor
    }
    



}
