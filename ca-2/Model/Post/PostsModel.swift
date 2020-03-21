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
    
    var userId:String
    
    var getTotalString: String {
        return "\(self.getTotal)"
    }
    
    var getTotal: Int {
        return pagination?.total ?? 0
    }
    
    init(userId: String){
        print("init post model")
        self.userId = userId
        loadData(userId: userId, skip: 0)
    }
    
    func loadData(userId: String, skip: Int) {
        print("running loadData! \(userId) \(skip)")
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
                do{
                    
                    let pageResult = try JSONDecoder().decode(PostPagination.self, from: data)
                    var response: PostPagination
                    
                    if(skip == 0) {
                        response = pageResult
                    } else {
                        response = self.pagination!
                        for post in pageResult.data {
                            response.data.append(post)
                        }
                    }
                    
                    print("Response! \(response)")
                    
                    DispatchQueue.main.async {
                        self.pagination = response
                    }
                } catch let error as NSError{
                    print("Error reading JSON file: \(error)")
                }
            }
        }.resume()
    }
}
