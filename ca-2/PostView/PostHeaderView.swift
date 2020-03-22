//
//  PostHeaderView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostHeaderView: View {
    var postItem: Post
    var photoUrl = "\(baseUrl)users/photo/"
    @ObservedObject var likesModel: LikesModel
    
    var body: some View {
        HStack {
            NavigationLink(destination: UserDetailView(userId: postItem.postedBy.id, likesModel: self.likesModel)) {
                ImageView(url: "\(photoUrl)\(postItem.postedBy.id)")
                    .frame(width: 40.0, height: 40.0)
                Text(postItem.postedBy.name)
                    .padding([.leading, .trailing], 10)
                Spacer()
                Text("Views: \(postItem.views)")
                    .font(.caption)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PostHeaderView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!, likesModel: LikesModel())
    }
}
