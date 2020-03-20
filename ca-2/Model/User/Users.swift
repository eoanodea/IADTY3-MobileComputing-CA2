//
//  Users.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

struct Users:Codable, Identifiable{
    var id:String
    var name:String
    var created: String
    var hasPhoto: Bool? = true
        
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case created
        case hasPhoto
    }
}
