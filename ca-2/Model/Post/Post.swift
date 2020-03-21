//
//  Post.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: String
    var views: Int
    var isPhoto: Bool
    var comments = [Follow]()
    var created:String
    var postedBy = [Follow]()


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case views
        case isPhoto
        case comments
        case created
        case postedBy
    }
}

struct PostPagination: Codable, Identifiable {
    var id: ObjectIdentifier
    
    var total: Int
    var hasMore: Bool
    var pageSize: Int
//    var data = [Post]()
    
    enum CodingKeys: String, CodingKey {
        case total
        case hasMore
        case pageSize
        case data
    }
}
