//
//  PostVideoView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import AVKit

struct PostVideoView: View {
    var url: String = ""
    
    var body: some View {
        VStack {
            if(url == "") {
                Text("No url")
            } else {
                Text("Video")
                VideoView(url: URL(string: "https://dev-the-locker-room.herokuapp.com/api/posts/video/5e5456f34971070017623a32")!)
            }
            
        }
    }
}

struct PostVideoView_Previews: PreviewProvider {
    static var previews: some View {
        PostVideoView(url: "https://dev-the-locker-room.herokuapp.com/api/posts/video/5e5456f34971070017623a32.mp4")
    }
}
