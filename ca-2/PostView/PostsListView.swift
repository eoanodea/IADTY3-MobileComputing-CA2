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
    var postsModel: PostsModel
    var hasLoaded = false
    
    init(userId: String) {
        self.userId = userId
        self.postsModel = PostsModel(userId: userId)
        self.hasLoaded = true
    }
    
    
    var body: some View {
        VStack {
            Text("Hello, World! \(userId)")
            Text("Posts: \(postsModel.getTotal)")
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(userId: "")
    }
}
