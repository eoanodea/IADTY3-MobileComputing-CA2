//
//  LikesModel.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

struct Like {
    static let keyOne = "likedPosts"
}

class LikesModel: ObservableObject {
    @Published var likes: [String] = []
    let defaults = UserDefaults.standard
    
    init() {
//        self.addTestData()
        self.getAllLikes()
    }
    
    func getAllLikes() {
        if let decoded  = defaults.object(forKey: Like.keyOne) as? Data {
            if let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) {
                    self.likes = decodedTeams as! [String]
            }
        }
    }
    
    func checkLike(postId: String) -> Bool {
        let likes = self.likes
        let filteredLikes = likes.filter{ $0 == postId }
        let result = filteredLikes.count > 0 ? true : false

        return result
    }
    
    func addLike(postId: String) {
        var likes = self.likes
        likes.append(postId)
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: likes)
        defaults.set(encodedData, forKey: Like.keyOne)
        self.likes = likes
    }
    
    func addTestData() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
        defaults.set(encodedData, forKey: Like.keyOne)
        defaults.synchronize()
    }
    
    func removeLike(postId: String) {
        var likes = self.likes
        let resultLikes = likes.filter{ $0 != postId }
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: resultLikes)
        defaults.set(encodedData, forKey: Like.keyOne)
        self.likes = likes
    }
}


var data: [String] = [
"5e38aa11af9398001701af4a",
"5e388d503467bb001788c3d0"
]
