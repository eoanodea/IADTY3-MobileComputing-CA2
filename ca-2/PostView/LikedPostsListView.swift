//
//  LikedPostsListView.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct LikedPostsListView: View {
    @ObservedObject var likesModel: LikesModel
    
    init() {
        self.likesModel = LikesModel()
        self.likesModel.getLikedPosts()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if(likesModel.loading) {
                    Text("Loading..")
                }
                else if(likesModel.getTotal > 0) {
                    ScrollView {
                        ForEach(likesModel.posts) { item in
                            NavigationLink(destination: PostDetailView(postItem: item)) {
                                LikedPostsRowView(postItem: item)
                                .listRowInsets(EdgeInsets())
                            }.buttonStyle(PlainButtonStyle())
                        }.navigationBarTitle("Liked Posts: \(likesModel.getTotal)")
                    }
                    
                } else {
                    Text("You have not liked any posts")
                }
            }
        }
    }
}

struct LikedPostsListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsListView()
    }
}
