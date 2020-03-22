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
    @ObservedObject var likesModel: LikesModel
    
    init(postItem: Post, likesModel: LikesModel) {
        self.postItem = postItem
        self.likesModel = likesModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            PostHeaderView(postItem: postItem, likesModel: likesModel)
            if(postItem.isPhoto) {
                PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                    .cornerRadius(5)
            } else {
                PostRowVideoView()
            }
            PostSocialIconView(postItem: postItem, likesModel: likesModel)
            PostPostedByInfoView(postItem: postItem, likesModel: likesModel)
        }
        .padding(15)
    }
}

struct LikedPostsRowView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsRowView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!, likesModel: LikesModel())
    }
}
