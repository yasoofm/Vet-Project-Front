//
//  SigninResponse.swift
//  VetApp
//
//  Created by Nada Alshaibani on 12/03/2024.
//

import Foundation
struct SignInResponse: Codable{
    var id: Int64
    var email: String
    var role: String
    var token: String
    var username: String
    var name: String?
    var image: String?
    var equipment: String?
    var experience: Int64?
    var phoneNumber: Int64
}


