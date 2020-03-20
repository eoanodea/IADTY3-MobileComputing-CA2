//
//  UserModel.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import Foundation

/// The Model for holding a User
class UserModel: ObservableObject {
    var users = [Users]()

    init() {
        loadData()
    }
    
//    func loadData() {
//        do{
//            users = try JSONDecoder().decode(Array<Users>.self, from: data)
//            print("got items!")
//        } catch let error as NSError{
//            print("Error reading JSON file: \(error)")
//        }
//    }
    
        func loadData() {
            guard let url = URL(string: "https://dev-the-locker-room.herokuapp.com/api/users") else {
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
                        
                            print("Got response! \(result)")
                            DispatchQueue.main.async {
                                self.users = result
                            }
                        } catch let error as NSError{
                            print("Error reading JSON file: \(error)")
                        }
                    }
                
                }.resume()

                //Since we return after the DispatchQueue,
                //This code will only run if there is an error
                //with the data
//                print("Fetch Failed: \(error?.localizedDescription ?? "Unknown error")")
    }
}


//let data = """
//[{"_id":"5e2489c751f65800175f6332","name":"testuk3","created":"2020-01-19T16:54:31.299Z"},{"_id":"5e234cf7019ae20017fa4427","name":"testuk2","created":"2020-01-18T18:22:47.065Z"},{"_id":"5df7939d203e230017657219","name":"bigpod","created":"2019-12-16T14:24:29.743Z"},{"_id":"5df67bb70047b50017313222","name":"noorsmusicinthekitchen","created":"2019-12-15T18:30:15.676Z"},{"_id":"5debe5cf8a91070017921ebc","name":"testtest","created":"2019-12-07T17:47:59.263Z"},{"_id":"5de4bef8ef4e8200177fd8f6","name":"aoibhinnodea@gmail.com","created":"2019-12-02T07:36:24.668Z"},{"_id":"5dd2abca8c7583092a766b8f","name":"testsellerus9","created":"2019-11-18T14:33:46.030Z"},{"_id":"5dc6818a4cd44b41aa22496d","name":"testseller8","created":"2019-11-09T09:06:18.886Z"},{"_id":"5dc610f4634862001768be28","name":"testseller7","created":"2019-11-09T01:05:56.469Z"},{"_id":"5dc44e8c01f0506cb02b50c7","name":"testseller6","created":"2019-11-07T17:04:12.532Z"},{"_id":"5db9e144b391cbf114bfae41","name":"testsellerus","created":"2019-10-30T19:15:16.403Z"},{"_id":"5db9d1fc116a0f2804d0a388","name":"testadmin4","created":"2019-10-30T18:10:04.447Z"},{"_id":"5db8c1451fd344cdb57bde90","name":"testseller2","created":"2019-10-29T22:46:29.750Z"},{"_id":"5db8bcd09c246900173d3795","name":"testadmin3","created":"2019-10-29T22:27:28.463Z"},{"_id":"5db825b6ff755c00174f2df0","name":"jafoole_ramoose_97","created":"2019-10-29T11:42:46.322Z"},{"_id":"5db707928c1d073dc8b285fd","name":"testadmin2","created":"2019-10-28T15:21:54.261Z"},{"_id":"5dadf3c4f2bfa40c9a1753a9","name":"testseller","created":"2019-10-21T18:07:00.044Z"},{"_id":"5d99e42f8964e3a3f68b281b","name":"testire","created":"2019-10-06T12:55:11.209Z"},{"_id":"5d98aef3e1d1007e283d6b15","name":"testuk","created":"2019-10-05T14:55:47.579Z"},{"_id":"5d9762f387fff7840f29a97a","name":"bernice o’reilly","created":"2019-10-04T15:19:15.280Z"},{"_id":"5d8e3d96ad9fde83e7248433","name":"testaccount13","created":"2019-09-27T16:49:26.302Z"},{"_id":"5d877908b8f2f962cd9ae4c6","name":"testaccount12","created":"2019-09-22T13:37:12.140Z"},{"_id":"5d812105fcb5ad2e260ab11d","name":"testaccount10","created":"2019-09-17T18:08:05.033Z"},{"_id":"5d76a3348ab26f0bfc7d22f6","name":"Test Account 8","created":"2019-09-09T19:08:36.091Z"},{"_id":"5d6d35f5dd78e177114eb392","name":"test4","created":"2019-09-02T15:32:05.807Z"}]
//""".data(using: .utf8)!


extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
