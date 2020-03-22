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
    //Observed objects are essentially watched data
    //They will update in realtime as the Model Updates it
    @ObservedObject var userList = UsersModel()
    @ObservedObject var likesModel: LikesModel
    
    //The state object handles the textfield input
    //for the search box.
    //This is bound to the render and will update and filter
    //Users in real time
    @State private var searchTerm:String = ""
    
    init(likesModel: LikesModel) {
        self.likesModel = likesModel
    }
    
    var body: some View {
        //Filtered users from the userModel, with the searchTerm passed
        //As a parameter
        let filteredUsers = userList.filterUsers(term: searchTerm)
        
        //Navigation view handles the list-detail type
        //of control provided on this page
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

//This represents a Row within the list,
//it simply displays the row and will navigate to the
//detail page of that row, passing all parameters with it
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
