//
//  PostDetailView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
    The detail view for a post,
    used both on profile post view
    and liked post view
 */
struct PostDetailView: View {
    var postItem: Post
    var postUrl = "\(baseUrl)posts/"
    @ObservedObject var likesModel: LikesModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                PostHeaderView(postItem: postItem, likesModel: likesModel)
                if(postItem.isPhoto) {
                    PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                        .cornerRadius(5)
                    
                } else {
                    PostVideoView(url: "\(postUrl)video/\(postItem.id)")
                }
                PostSocialIconView(postItem: postItem, likesModel: likesModel)
                PostPostedByInfoView(postItem: postItem, likesModel: likesModel)
            }

        }
        .padding(.top, 20)
        .frame(width: 350.0)
        .navigationBarTitle(Text("Post"), displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!, likesModel: LikesModel())
    }
}

