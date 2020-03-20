//
//  User.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var email: String
    var created: String
    var updated: String
    var confirmed: Bool
    var blocked: Bool
    var isPrivate: Bool
    var followers = [Follow]()
    var following = [Follow]()
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case email
        case created
        case updated
        case confirmed
        case blocked
        case isPrivate = "private"
        case followers
        case following
    }
}
