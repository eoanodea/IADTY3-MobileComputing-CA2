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
    @Published var posts = [Post]()
    var loading: Bool = true
    
    let defaults = UserDefaults.standard
    
    init() {
//        self.addTestData()
        self.getAllLikes()
    }
    
    func getLikedPosts() {
        if(self.getTotal > 0) {
            self.loading = true
            for like in likes {
                print("Fetching post with \(like)")
                self.loadPost(postId: like)
            }
            self.loading = false
        }
    }
    
    var getTotal: Int {
        return likes.count
    }
    
    var getTotalString: String {
        return "\(self.getTotal)"
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
    
    func loadPost(postId: String) {
        
        guard let url = URL(string: "\(baseUrl)posts/\(postId)/") else {
            print("invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        
        /**
         Creates a networking task from the url request
         Takes three parameters:
         
         `data` - returned from request
         `response` - description of data, status, weight etc
         `error` - if an error had occured
         
         .resume ensures the request starts immediately in the background
         and is controlled by the system
         */
        URLSession.shared.dataTask(with: request) { data, response, error in
            //Runs after .resume() has been completed
            if let data = data {
                do {
                    
                    let response = try JSONDecoder().decode(Post.self, from: data)
                    
                    var posts = self.posts
                    posts.append(response)
                    
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                } catch let error as NSError{
                    print("Error reading JSON file: \(error)")
                }
            }
        }.resume()
    }
}


var data: [String] = [
"5e38aa11af9398001701af4a",
"5e388d503467bb001788c3d0"
]
