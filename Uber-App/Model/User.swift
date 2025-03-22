//
//  User.swift
//  Uber-App
//
//  Created by Sabri Çetin on 22.03.2025.
//

import Foundation
import CoreLocation


enum AccountType : Int {
    case passenger
    case driver
}

struct User {
    let fullName : String
    let email : String
    var accountType : AccountType!
    var location: CLLocation?
    let uid: String
    var homeLocation: String?
    var workLocation: String?

    
    var firstInitial: String {
        return String(fullName.prefix(1))
    }
    
    init(uid: String , dictionary: [String: Any]) {
        
        self.uid = uid
        self.fullName = dictionary["fullname"] as? String ?? "Anonymous"
        self.email = dictionary["email"] as? String ?? ""
        
        if let home = dictionary["homeLocation "] as? String {
            self.homeLocation = home
        }
        
        if let work = dictionary["workLocation"] as? String {
            self.workLocation = work
        }
        
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
        
    }
}

