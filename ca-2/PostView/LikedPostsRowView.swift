//
//  LikedPostsRowView.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct LikedPostsRowView: View {
    var postItem: Post
    var postUrl = "\(baseUrl)posts/"
//    @ObservedObject var postsModel: PostsModel
    
    init(postItem: Post) {
        self.postItem = postItem
//        self.postsModel = model
//        self.postsModel.fetchMore(postId: postItem.id)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            PostHeaderView(postItem: postItem)
            if(postItem.isPhoto) {
                PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                    .cornerRadius(5)
            } else {
                PostRowVideoView()
            }
            PostSocialIconView(postItem: postItem)
            PostPostedByInfoView(postItem: postItem)
        }
        .padding(15)
    }
}

struct LikedPostsRowView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsRowView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!)
    }
}
