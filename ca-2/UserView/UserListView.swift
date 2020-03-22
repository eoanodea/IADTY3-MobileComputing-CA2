//
//  UserListView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
 View for displaying a list of users
 */
struct UserListView: View {
    @ObservedObject var userList = UsersModel()
    @State private var searchTerm:String = ""
    @ObservedObject var likesModel: LikesModel
    
    init(likesModel: LikesModel) {
        self.likesModel = likesModel
    }
    
    var body: some View {
        let filteredUsers = userList.filterUsers(term: searchTerm)
        
        return NavigationView{
            VStack {
                if(userList.total > 0) {
                    SearchBar(text: $searchTerm)
                    List {
                        ForEach(filteredUsers!) { item in
                            UserListRowNavigation(item: item, likesModel: self.likesModel)
                        }
                    }.navigationBarTitle("Users")
                } else {
                    Text("Loading...")
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(likesModel: LikesModel())
    }
}

struct UserListRowNavigation: View {
    var item: Users
    @ObservedObject var likesModel: LikesModel
    
    var body: some View {
        NavigationLink(destination: UserDetailView(userId: item.id, likesModel: self.likesModel)) {
            UserRowView(userItem: item)
                .listRowInsets(EdgeInsets())
        }
    }
}
