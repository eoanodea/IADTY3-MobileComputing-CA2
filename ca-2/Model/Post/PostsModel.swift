//
//  PostsModel.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

/// The Model for holding a list of Posts
class PostsModel: ObservableObject {
    @Published var pagination: PostPagination?
    var loading: Bool = false
    var userId:String
    var skip:Int = 0
    
    var getTotalString: String {
        return "\(self.getTotal)"
    }
    
    var getTotal: Int {
        return pagination?.total ?? 0
    }
    
    init(userId: String){
        self.userId = userId
        loadData(userId: userId, skip: 0)
    }
    
    //Checks is a post is the last in the array
    //And if there are more posts on the server
    //If so will incrementally fetch posts until there are none left
    func fetchMore(postId: String) {
        if(self.pagination!.hasMore) {
            for (idx, post) in (self.pagination?.data.enumerated())! {
                if (idx == ((self.pagination?.data.endIndex)!-1) && post.id == postId) {
                    let skip = self.skip + 2
                    loadData(userId: self.userId, skip: skip)
                }
            }
        }
    }
    
    func loadData(userId: String, skip: Int) {
        self.loading = true
        
        guard let url = URL(string: "\(baseUrl)posts/by/\(userId)/\(skip)") else {
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
                    
                    let pageResult = try JSONDecoder().decode(PostPagination.self, from: data)
                    var response: PostPagination
                    
                    if(skip == 0) {
                        response = pageResult
                    } else {
                        response = self.pagination!
                        response.hasMore = pageResult.hasMore
                        for post in pageResult.data {
                            response.data.append(post)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.skip = skip
                        self.pagination = response
                        self.loading = false
                    }
                } catch let error as NSError{
                    print("Error reading JSON file: \(error)")
                }
            }
        }.resume()
    }
}
