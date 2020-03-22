//
//  PostsRowView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostsRowView: View {
    var postItem: Post
    var postUrl = "\(baseUrl)posts/"
    @ObservedObject var postsModel: PostsModel
    
    init(postItem: Post, model: PostsModel) {
        self.postItem = postItem
        self.postsModel = model
        self.postsModel.fetchMore(postId: postItem.id)
    }
    
    var body: some View {
        VStack {
            if(postItem.isPhoto) {
                PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                    .cornerRadius(5)
            } else {
                PostRowVideoView()
            }
            Text(postItem.text ?? "")
        }
        .padding(15)
    }
}

struct PostsRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostsRowView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!, model: PostsModel(userId: "5debe5cf8a91070017921ebc"))
    }
}

