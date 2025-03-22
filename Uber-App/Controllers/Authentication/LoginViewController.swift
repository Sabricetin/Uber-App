//
//  LoginViewController.swift
//  Uber-App
//
//  Created by Sabri Çetin on 18.03.2025.
//

import UIKit
import Foundation
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    
    
    //MArk : - Properties
    
    private let titleLabel : UILabel = {
        
        let label           = UILabel()
        label.text          = "UBER"
        label.font          = UIFont(name: "Avenir-Light", size: 36)
        label.textColor     = UIColor(white: 1, alpha: 0.8)
        return label
        
    }()
    
    private lazy var emailContainerView: UIView = {
        let view  = UIView().inputContenierView(image: UIImage(systemName: "envelope")! , textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
          
    }()
        private let emailTextField: UITextField = {
            return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
        }()
    
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContenierView(image: UIImage(systemName: "lock")! , textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
        
        
    } ()
    
    private var passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Şifre", isSecureTextEntry: true)
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Giriş Yap ", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin) , for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccountButton : UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Bir hesabın yok mu" , 
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributeTitle.append(NSAttributedString(string: "Kayıt Ol",
        attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16) ,
                     NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        button.addTarget(self, action: #selector(handlerShowSignUP), for: .touchUpInside)
        button.setAttributedTitle(attributeTitle, for: .normal)
        return button
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        view.backgroundColor = .purple

    }
    
    //MARK: -Selector
    
    @objc func handleLogin () {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult , error in
            if let error = error  {
                print("Giriş yaparken bir hata oluştu\(error.localizedDescription)")
                return
            }
            
            if let windowScene =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene , let window = windowScene.windows.first ,
               let controller = window.rootViewController   as?
                ContainerController {
                controller.configure()

            }
            
            self.dismiss(animated: true)
        }
    }
    
    @objc func handlerShowSignUP() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    //MARK: Functions
    
    func configureUI() {
        configureNAvigationBar()
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView : view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView , passwordContainerView , loginButton])
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor , left: view.leftAnchor , right: view.rightAnchor , paddingTop: 40 , paddingLeft: 16 , paddingRight: 16)
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor , height: 32)
        
      
    }
    
    func configureNAvigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }

}
