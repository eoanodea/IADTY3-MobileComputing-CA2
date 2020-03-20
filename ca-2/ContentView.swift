//
//  ContentView.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

//struct Response: Codable {
//    var users: [Users]
//}

struct ContentView: View {
    @ObservedObject var userList = UserModel()
//     var orderModel: OrderModel
    var body: some View {
            VStack {
                List {
                    Section(
                        header: Text("Hello!!!")
                        ) {
                            ForEach(userList.users) {item in
                                Text(item.name)
                            }
                    }
                }.onAppear(perform: printStuff)
            }
    }
    
    func printStuff() {
        print("hello!! \(userList.users.first?.name ?? "no")")
    }
    
//    func loadData() {
//        guard let url = URL(string: "https://dev-the-locker-room.herokuapp.com/api/users") else {
//            print("invalid url")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        /**
//            Creates a networking task from the url request
//            Takes three parameters:
//
//             `data` - returned from request
//             `response` - description of data, status, weight etc
//             `error` - if an error had occured
//
//             .resume ensures the request starts immediately in the background
//                and is controlled by the system
//         */
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            //Runs after .resume() has been completed
//            if let data = data {
//                print("Getting data \(data) response \(response) error! \(error)")
//                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                    print("Response decoded! \(decodedResponse)")
//                    //Go back to the main thread
//                    DispatchQueue.main.async {
//                        //Update the results
//                        self.results = [decodedResponse]
//                    }
//
//                    //Return and exit the function
//                    return
//                }
//            }
//
//            //Since we return after the DispatchQueue,
//            //This code will only run if there is an error
//            //with the data
//            print("Fetch Failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
