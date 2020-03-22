//
//  PostsListView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
    Displays a list of posts on a user's profile
    Is designed to Lazy Load posts from it's Model,
    and will only fetch them two at a time
 */
struct PostsListView: View {
    var userId:String = ""
    var skip:Int = 0
    @ObservedObject var postsModel: PostsModel
    @ObservedObject var likesModel: LikesModel
    
    init(userId: String, likesModel: LikesModel) {
        self.userId = userId
        self.postsModel = PostsModel(userId: userId)
        self.likesModel = likesModel
    }
        
    var body: some View {
        VStack{
            if(postsModel.loading) {
                Text("Loading..")
            } else if(postsModel.getTotal > 0) {
                Text("Posts: \(postsModel.getTotalString)")
                ForEach(postsModel.pagination!.data) { item in
                    NavigationLink(destination: PostDetailView(postItem: item, likesModel: self.likesModel)) {
                        PostsRowView(postItem: item, model: self.postsModel, likesModel: self.likesModel)
                        .listRowInsets(EdgeInsets())
                    }.buttonStyle(PlainButtonStyle())
                }.navigationBarTitle("Posts: \(postsModel.getTotal)")
                
            } else {
                Text("User does not have any posts")
            }
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(userId: "", likesModel: LikesModel())
    }
}
