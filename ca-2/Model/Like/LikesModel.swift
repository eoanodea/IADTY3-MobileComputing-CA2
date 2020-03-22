//
//  LikesModel.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

//KeyOne is the key of which the likes array is stored under
struct Like {
    static let keyOne = "likedPosts"
}

/**
     LikesModel()
     Class which represents and handles all logic with the Like system
     
     Likes are stored persistantly in the devices storage, and will fetch a list
     of posts associated with this array
 */
class LikesModel: ObservableObject {
    @Published var likes: [String] = []
    @Published var posts = [Post]()
    var loading: Bool = false
    
    let defaults = UserDefaults.standard
    
    //Gets all likes from storage on init of class
    init() {
        self.getAllLikes()
    }
    
    //
    func getLikedPosts() {
        if(self.getTotal > 0) {
            for like in likes {
                let posts = self.posts
                let filteredPosts = posts.filter{ $0.id == like }.count
                if(filteredPosts < 1) {
                    print("Fetching post with \(like) \(filteredPosts)")
                    self.loadPost(postId: like)
                }
            }
        }
    }
    
    var getTotal: Int {
        return posts.count
    }
    
    var getTotalString: String {
        return "\(self.getTotal)"
    }
    
    func getAllLikes() {
        if let decoded  = defaults.object(forKey: Like.keyOne) as? Data {
            if let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) {
                    self.likes = decodedTeams as! [String]
                    self.getLikedPosts()
            }
        }
    }
    
    func checkLike(postId: String) -> Bool {
        let filteredLikes = likes.filter{ $0 == postId }
        return filteredLikes.count > 0 ? true : false
    }
    
    func addLike(postId: String) {
        var likes = self.likes
        likes.append(postId)
        print("Adding like \(likes.count) \(self.likes.count)")
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: likes)
        defaults.set(encodedData, forKey: Like.keyOne)
        self.likes = likes
        self.loadPost(postId: postId)
    }
    
    func addTestData() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
        defaults.set(encodedData, forKey: Like.keyOne)
        defaults.synchronize()
    }
    
    func removeLike(postId: String) {
        let newLikes = self.likes
        let resultLikes = newLikes.filter{ $0 != postId }
        print("Removing like \(likes.count) \(resultLikes.count)")
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: resultLikes)
        defaults.set(encodedData, forKey: Like.keyOne)
        self.removePost(postId: postId)
        likes = newLikes
    }
    
    func removePost(postId: String) {
        let newPosts = self.posts
        let resutPosts = newPosts.filter{ $0.id != postId }
        print("Post has been removed old: \(newPosts.count) new: \(resutPosts.count)")
        self.posts = resutPosts
    }
    
    func loadPost(postId: String) {
        let resutPosts = posts.filter{ $0.id == postId }.count
        print("Checking if post exists first! \(resutPosts)")
        if(resutPosts > 0) {return}
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
