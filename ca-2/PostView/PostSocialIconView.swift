//
//  PostSocialIconView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostSocialIconView: View {
    var postItem: Post
    @State var liked: Bool = false
    @ObservedObject var likesModel: LikesModel

    init(postItem: Post) {
        self.postItem = postItem
        self.likesModel = LikesModel()
    }
    
    func likePost() {
        if(!likesModel.checkLike(postId: postItem.id)) {
            likesModel.addLike(postId: postItem.id)
        } else {
            likesModel.removeLike(postId: postItem.id)
        }
        
        
    }
    
    var body: some View {
        HStack {
            Button(action: likePost) {
                Image(systemName: likesModel.checkLike(postId: postItem.id) ? "heart.fill" : "heart")
                    .font(.largeTitle)
                    .padding(5)
            }.buttonStyle(PlainButtonStyle())
        }.padding(10)
    }
}


struct PostSocialIconView_Previews: PreviewProvider {
    static var previews: some View {
        PostSocialIconView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!)
    }
}
