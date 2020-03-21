//
//  PostDetailView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    var postItem: Post
    var postUrl = "\(baseUrl)posts/"
    var photoUrl = "\(baseUrl)users/photo/"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ImageView(url: "\(photoUrl)\(postItem.postedBy.id)")
                    .frame(width: 40.0, height: 40.0)
                Text(postItem.postedBy.name)
            }
            if(postItem.isPhoto) {
                PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                    .cornerRadius(5)
                
            } else {
                PostVideoView(url: "\(postUrl)video/\(postItem.id)")
            }
            Text(postItem.text ?? "")
                .font(.caption)
        }
        .frame(width: 350.0, height: 100.0)
        .navigationBarTitle(Text("Post"), displayMode: .inline)
    
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!)
    }
}
