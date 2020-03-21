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
    var hasLoaded = false
    
    init(userId: String) {
        self.userId = userId
        self.postsModel = PostsModel(userId: userId)
        self.hasLoaded = true
    }
    
    var body: some View {
        VStack{
            if(postsModel.getTotal > 0) {
                Text("Posts: \(postsModel.getTotalString)")
                List(postsModel.pagination!.data) { item in
                    NavigationLink(destination: PostDetailView(postItem: item)) {
                        PostsRowView(postItem: item)
                        .listRowInsets(EdgeInsets())
                    }
                }.navigationBarTitle("Posts: \(postsModel.getTotal)")
            } else {
                Text("Loading..")
            }
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(userId: "")
    }
}
