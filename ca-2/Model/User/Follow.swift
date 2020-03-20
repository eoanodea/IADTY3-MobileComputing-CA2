//
//  Follow.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

struct Follow: Codable {
    var id: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(String.self, forKey: .id)
      self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(self.id, forKey: .id)
      try container.encode(self.name, forKey: .name)
    }
    
}
