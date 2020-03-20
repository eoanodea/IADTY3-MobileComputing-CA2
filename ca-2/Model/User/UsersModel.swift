//
//  UsersModel.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

var baseUrl: String = Bundle.main.infoDictionary!["BASE_URL"] as! String

/// The Model for holding a list of Users
class UsersModel: ObservableObject {
    @Published var users = [Users]()

    init() {
        loadData()
    }
    
    var total: Int {
        return users.count
    }
    
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
