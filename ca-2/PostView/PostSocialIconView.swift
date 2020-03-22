//
//  PostSocialIconView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
    This view interacts with the likesModels like system.
    it checks if the post has been liked, and can add/remove a like
*/
struct PostSocialIconView: View {
    var postItem: Post
    @ObservedObject var likesModel: LikesModel

    init(postItem: Post, likesModel: LikesModel) {
        self.postItem = postItem
        self.likesModel = likesModel
    }
    
    func likePost() {
        if(!likesModel.checkLike(postId: postItem.id)) {
            print("liking post")
            likesModel.addLike(postId: postItem.id)
        } else {
            print("Unliking post!")
            likesModel.removeLike(postId: postItem.id)
        }
    }
    
    var body: some View {
        let isLiked:Bool = likesModel.checkLike(postId: postItem.id)
        print("Isliked \(isLiked)")
        return HStack {
            Button(action: likePost) {
                Image(systemName: isLiked
                    ? "heart.fill"
                    : "heart"
                )
                .font(.largeTitle)
                .padding(5)
            }.buttonStyle(PlainButtonStyle())
        }.padding(10)
    }
}


struct PostSocialIconView_Previews: PreviewProvider {
    static var previews: some View {
        PostSocialIconView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!, likesModel: LikesModel())
    }
}
