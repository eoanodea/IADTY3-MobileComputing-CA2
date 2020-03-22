//
//  Comment.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

/**
   Comment
   Represents a Comment object within a Post
*/
struct Comment: Codable, Identifiable {
    var id: String
    var created:String
    var text: String?
    var postedBy: Follow
  
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case created
        case text
        case postedBy
    }
}
