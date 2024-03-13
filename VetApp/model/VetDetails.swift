//
//  Vet.swift
//  VetApp
//
//  Created by Nada Alshaibani on 11/03/2024.
//

import Foundation

struct VetDetails: Codable{
    
    var id: Int64?
    var name: String
    var username: String
    var email: String
    var phoneNumber: Int64 
    var specialty: String
    var experience: Int
    var equipment: String
    var image: String
    var password: String
    var status: String
}
