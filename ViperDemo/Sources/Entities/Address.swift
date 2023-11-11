//
//  Address.swift
//  ViperDemo
//
//  Created by Marcos Debastiani on 09/11/23.
//

import Foundation

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

