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
    var text: String?
//    var comments = [Follow]()
    var created:String
    var postedBy: Follow


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case views
        case isPhoto
        case text
//        case follow
//        case comments
        case created
        case postedBy
    }
}

struct PostPagination: Codable {
    var total: Int
    var hasMore: Bool
    var pageSize: Int
    var data = [Post]()
    
    enum CodingKeys: String, CodingKey {
        case total
        case hasMore
        case pageSize
        case data
    }
}
