//
//  UserDetailView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    var photoUrl = "\(baseUrl)users/photo/"
    var userId: String = ""
    var userModel: UserModel
    var hasLoaded = false
    
    init(userId: String) {
        self.userId = userId
        self.userModel = UserModel(userId: userId)
        
        self.hasLoaded = true
        print("user!! \(userId)! \(String(describing: userModel.user?.name))")
    }
    
    var body: some View {
        VStack {
            ImageView(url: "\(photoUrl)\(userId)")
            .frame(width: 100.0, height: 100.0)
            if (hasLoaded) {
                Text("Hello \(userModel.user?.name ?? "No User")")
            } else {
                Text("Loading...")
            }
        }
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(userId: "")
//    }
//}
