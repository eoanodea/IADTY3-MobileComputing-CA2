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
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if (hasLoaded) {
                HStack {
                    ImageView(url: "\(photoUrl)\(userId)")
                    .frame(width: 100.0, height: 100.0)
                    Spacer()
                    HStack {
                        UserCountView(count: userModel.countFollowers, text: "Followers")
                        UserCountView(count: userModel.countFollowing, text: "Following")
                        UserCountView(count: userModel.countFollowers, text: "Followers")
                    }
//                    Text("\(userModel.user!.name)")
//                        .font(.largeTitle)
//                        .padding(20)
                    
                }
                .navigationBarTitle(Text(userModel.user!.name), displayMode: .inline)
                .padding(40)
            } else {
                Text("Loading...")
            }
            Spacer()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userId: "")
    }
}
