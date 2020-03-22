//
//  UserModel.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

/**
    UsersModel()
    Class which represents and handles all logic with a single User
    
    Fetches a user from the database and can only be initialized with a
    userId
*/
class UserModel: ObservableObject {
    @Published var user: User?
    var userId:String
    
    //Initializes the Model with a user's ID
    init(userId: String){
        self.userId = userId
        loadUser(userId: userId)
    }
    
    //Loads an array of users from the server asyncronously
    func loadUser(userId: String) {
        guard let url = URL(string: "\(baseUrl)user/\(self.userId)") else {
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
                    let result = try JSONDecoder().decode(User.self, from: data)

                    DispatchQueue.main.async {
                        self.user = result
                    }
                } catch let error as NSError{
                    print("Error reading JSON file: \(error)")
                }
            }
        }.resume()
    }
    
    ///Returns the total number of followers
    var countFollowers: Int {
        return user?.followers.count ?? 0
    }
    
    ///Returns the total number of followering
    var countFollowing: Int {
        return user?.following.count ?? 0
    }
}
