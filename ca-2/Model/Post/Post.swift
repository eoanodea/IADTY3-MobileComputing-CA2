//
//  Post.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

/**
    Post
    Represents a Post object fetched from the server
 */
struct Post: Codable, Identifiable {
    var id: String
    var views: Int
    var isPhoto: Bool
    var text: String?
    var likes = [String]()
    var comments = [Comment]()
    var created:String
    var postedBy: Follow

    //Because the Post object on the server has a key value of _id,
    //We need to let swift know of this and to convert it to id
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case views
        case isPhoto
        case text
        case likes
        case created
        case postedBy
    }
}
