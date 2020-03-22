//
//  ContentView.swift
//  ca-2
//
//  Created by Eoan on 18/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
    Root View for the entire application
*/
struct ContentView: View {
    @ObservedObject var likesModel: LikesModel

    var body: some View {
        TabView {
            UserListView(likesModel: likesModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Users")
            }
            LikedPostsListView(likesModel: likesModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourite Posts")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(likesModel: LikesModel())
    }
}
