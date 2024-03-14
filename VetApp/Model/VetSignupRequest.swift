//
//  VetSignupRequest.swift
//  VetApp
//
//  Created by yousef mandani on 14/03/2024.
//

import Foundation

struct VetSignupRequest: Codable{
    var name: String
    var username: String
    var email: String
    var phoneNumber: Int64
    var speciality: String
    var experience: Int
    var equipment: String
    var image: String
    var password: String
}
