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
    @State private var searchTerm:String = ""
    
    var body: some View {
        let filteredUsers = userList.filterUsers(term: searchTerm)
        
        return NavigationView{
            VStack {
                if(userList.total > 0) {
                    SearchBar(text: $searchTerm)
                    List {
                        ForEach(filteredUsers!) { item in
                             UserListRowNavigation(item: item)
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
        UserListView()
    }
}

struct UserListRowNavigation: View {
    var item: Users
    
    var body: some View {
        NavigationLink(destination: UserDetailView(userId: item.id)) {
            UserRowView(userItem: item)
                .listRowInsets(EdgeInsets())
        }
    }
}
