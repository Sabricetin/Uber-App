//
//  AuthButton.swift
//  Uber-App
//
//  Created by Sabri Çetin on 18.03.2025.
//

import Foundation
import UIKit

class AuthButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = .mainBlueTint
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init? (coder aDecoder: NSCoder) {
        fatalError("init(coder) uygulanmadı")
    }
}
