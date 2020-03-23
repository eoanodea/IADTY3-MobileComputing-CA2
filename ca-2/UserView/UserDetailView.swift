//
//  UserDetailView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
 UserDetailView is the users profile page
 it displays information about the user,
 and displays a list of their posts
 */
struct UserDetailView: View {
    //Base URL concatenated with extras for user's photo API Fetch
    var photoUrl = "\(baseUrl)users/photo/"
    var userId: String = ""
    var userModel: UserModel
    @ObservedObject var likesModel: LikesModel
    
    //Init the view with the user's ID
    init(userId: String, likesModel: LikesModel) {
        self.userId = userId
        self.userModel = UserModel(userId: userId)
        self.likesModel = likesModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ImageView(url: "\(photoUrl)\(userId)", size: 100)
                        .frame(width: 100.0, height: 100.0)
                    Spacer()
                    HStack {
                        UserCountView(count: userModel.countFollowers, text: "Followers")
                        UserCountView(count: userModel.countFollowing, text: "Following")
                    }
                }
                .navigationBarTitle(Text(userModel.user?.name ?? "User"), displayMode: .inline)
                .padding(40)
                PostsListView(userId: self.userId, likesModel: self.likesModel)

            }
        }
        .padding(.top, 50)
        .animation(.easeInOut)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userId: "", likesModel: LikesModel())
    }
}
