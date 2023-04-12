//
//  RegisterModel.swift
//  My UI Kit Playground
//
//  Created by Yusuf Saifudin on 12/04/23.
//

import Foundation

struct RegisterModel: Codable {
    var name: String
    var email: String
    var password: String
    var confirmPassword: String
}
