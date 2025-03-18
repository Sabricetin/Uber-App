//
//  LoginViewController.swift
//  Uber-App
//
//  Created by Sabri Çetin on 18.03.2025.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    
    //MArk : - Properties
    
    private let titleLabel : UILabel = {
        
        let label = UILabel()
        label.text = "UBER"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
        
    }()
    
    private lazy var emailContainerView: UIView = {
        let view    = UIView().inputContenierView(image: UIImage(systemName: "envelope") , textfield: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
        
    }()
        private let emailTextField: UITextField = {
            return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
        }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Şifre", isSecureTextEntry: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
