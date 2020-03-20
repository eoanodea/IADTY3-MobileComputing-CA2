//
//  UserListView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var userList = UsersModel()
    
    var body: some View {
        NavigationView{
            if(userList.total > 0) {
                List(userList.users) { item in
                    NavigationLink(destination: UserDetailView(userItem: item)) {
                        UserRowView(userItem: item)
                        .listRowInsets(EdgeInsets())
                    }
                }
            } else {
                Text("Loading!").font(.headline)
            }
        }.navigationBarTitle("Users")
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
