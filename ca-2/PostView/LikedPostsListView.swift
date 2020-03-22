//
//  LikedPostsListView.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
   Displays a list of posts on the favourited posts
    tab. Takes this list from the likesModel
*/
struct LikedPostsListView: View {
    @ObservedObject var likesModel: LikesModel
    
    init(likesModel: LikesModel) {
        self.likesModel = likesModel
    }
    
    var body: some View {
        VStack{
            if(likesModel.loading) {
                Text("Loading..")
            }
            else if(likesModel.getTotal > 0) {
                NavigationView{
                    ScrollView {
                        ForEach(likesModel.posts) { item in
                            NavigationLink(destination: PostDetailView(postItem: item, likesModel: self.likesModel)) {
                                LikedPostsRowView(postItem: item, likesModel: self.likesModel)
                                    .listRowInsets(EdgeInsets())
                            }.buttonStyle(PlainButtonStyle())
                        }.navigationBarTitle("Liked Posts: \(likesModel.getTotal)")
                    }
                }
            } else {
                Text("You have not liked any posts")
            }
        }
    }
}

struct LikedPostsListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsListView(likesModel: LikesModel())
    }
}
