//
//  PostRowVideoView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/*
    The videoView of a post within a list
    only contains an icon and link to the post detail
*/
struct PostRowVideoView: View {
    var icon: String = "video.fill"
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: CGFloat(50)))
                .foregroundColor(.red)
            Spacer()
        }
        .padding(30)
        .padding([.top, .bottom], 50)
        .background(Color(.black))
        .cornerRadius(5)
    }
}

struct PostRowVideoView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowVideoView(icon: "video.fill")
    }
}
