//
//  User.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 11/9/23.
//

import Foundation

struct User: Codable {
    var id: Int
    var name, username, email: String
    var address: Address
}
