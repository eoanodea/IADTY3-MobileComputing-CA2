//
//  PostPagination.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

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
