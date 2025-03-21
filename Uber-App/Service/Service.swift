//
//  Service.swift
//  Uber-App
//
//  Created by Sabri Çetin on 21.03.2025.
//

import Foundation
import FirebaseDatabase

//MARK: -database Ref

let DB_REF                  = Database.database(url: "https://uber-app-f6470-default-rtdb.firebaseio.com/").reference()

let REF_USERS               = DB_REF.child("users")
let REF_DRIVER_LOCATIONS    = DB_REF.child("drivver-locations")
let REF_TRIPS               = DB_REF.child("trips")
