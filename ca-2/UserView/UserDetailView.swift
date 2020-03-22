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
    
    init(userId: String) {
        self.userId = userId
        self.userModel = UserModel(userId: userId)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ImageView(url: "\(photoUrl)\(userId)", size: 100)
                        .frame(width: 100.0, height: 100.0)
                    Spacer()
                    HStack {
                        UserCountView(count: userModel.countFollowers, text: "Posts")
                        UserCountView(count: userModel.countFollowers, text: "Followers")
                        UserCountView(count: userModel.countFollowing, text: "Following")
                    }
                }
                .navigationBarTitle(Text(userModel.user!.name), displayMode: .inline)
                .padding(40)
                PostsListView(userId: self.userId)

            }
        }
        .padding(.top, 50)
        .animation(.easeInOut)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userId: "")
    }
}
