//
//  UsersModel.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

var baseUrl: String = Bundle.main.infoDictionary!["BASE_URL"] as! String

/**
    UsersModel()
    Class which represents and handles all logic with the Users system
    
    Fetches users from the database
*/
class UsersModel: ObservableObject {
    @Published var users = [Users]()

    //Load data on init
    init() {
        loadData()
    }
    
    //Returns the total number of users in Int format
    var total: Int {
        return users.count
    }
    
    //Filters the users depending on the term provided
    //If the term is empty, it returns all users
    //If not, it will compare each user's name in lowercase format
    //To the search term in lowercase format
    func filterUsers(term: String) -> [Users]! {
        if(term.isEmpty) {return users}
        
        return users.filter{ $0.name.lowercased().contains(term.lowercased()) };
    }
    
    //Loads an array of users from the server asyncronously
    func loadData() {
        guard let url = URL(string: "\(baseUrl)users") else {
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
                    let result = try JSONDecoder().decode(Array<Users>.self, from: data)
                
                    DispatchQueue.main.async {
                        self.users = result
                    }
                } catch let error as NSError{
                    print("Error reading JSON file: \(error)")
                }
            }
        }.resume()
    }
}
