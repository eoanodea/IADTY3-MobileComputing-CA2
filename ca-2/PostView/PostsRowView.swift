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
    
    var body: some View {
        VStack {
            if(postItem.isPhoto) {
                PostImageView(url: "\(postUrl)photo/\(postItem.id)")
                    .cornerRadius(5)
                Text("Post!")
                    .font(.caption)
            } else {
                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "video.fill")
                        .font(.system(size: CGFloat(50)))
                        .foregroundColor(.red)
                    Spacer()
                }.padding(30)
            }
            Text(postItem.text ?? "")
        }
        .padding(15)
    }
}

struct PostsRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostsRowView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!)
    }
}
