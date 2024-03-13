//
//  User.swift
//  VetApp
//
//  Created by Nada Alshaibani on 11/03/2024.
//

import Foundation

struct User: Codable{
    
    var id: Int64?
    var userName: String
    var email: String
    var role: String?
    var token: String?
    var phoneNumber: Int64
    var password: String
}
