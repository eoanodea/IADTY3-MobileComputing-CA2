//
//  PostsListView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostsListView: View {
    var userId:String = ""
    var skip:Int = 0
    @ObservedObject var postsModel: PostsModel
    
    init(userId: String) {
        self.userId = userId
        self.postsModel = PostsModel(userId: userId)
    }
    
    var body: some View {
        VStack{
            if(postsModel.loading) {
                Text("Loading..")
            }
            else if(postsModel.getTotal > 0) {
                Text("Posts: \(postsModel.getTotalString)")
                ForEach(postsModel.pagination!.data) { item in
                    NavigationLink(destination: PostDetailView(postItem: item)) {
                        PostsRowView(postItem: item)
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
        PostsListView(userId: "")
    }
}
