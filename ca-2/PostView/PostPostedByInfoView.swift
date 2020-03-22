//
//  PostPostedByInfoView.swift
//  ca-2
//
//  Created by Eoan on 22/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostPostedByInfoView: View {
    var postItem: Post

    let today = Date()
    

    var body: some View {
        VStack{
            HStack {
                NavigationLink(destination: UserDetailView(userId: postItem.postedBy.id)) {
                Text(postItem.postedBy.name)
                    .bold()
                }.buttonStyle(PlainButtonStyle())
                Text(postItem.text ?? "")
                    .font(.caption)
            }
            Spacer()
            Text(today.toString(dateFormat: postItem.created))
                .font(.caption)
            
        }
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}

struct PostPostedByInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PostPostedByInfoView(postItem: (PostsModel(userId: "5debe5cf8a91070017921ebc").pagination?.data[0])!)
    }
}
