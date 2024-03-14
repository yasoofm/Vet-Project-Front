//
//  User.swift
//  VetApp
//
//  Created by Nada Alshaibani on 11/03/2024.
//

import Foundation

struct UserSignupRequest: Codable{
    var username: String
    var email: String
    var phoneNumber: Int64
    var password: String
}

