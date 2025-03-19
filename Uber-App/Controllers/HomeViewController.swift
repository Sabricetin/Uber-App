//
//  HomeViewController.swift
//  Uber-App
//
//  Created by Sabri Çetin on 19.03.2025.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
    
    var user: User? {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
    }
    

   
}
