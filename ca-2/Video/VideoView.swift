//
//  VideoView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import VideoPlayer
import CoreMedia

/**
    This View was the origional plan for video, it is not being used now.
    Videos are being streamed from a Node.js/Express.js server in binary format converted to .mp4
    Alot of time was spent attempting to get this to work with the streamed videos, but unfortunately was never sucessful, so PostVideoView was used instead with WebViews.
 */
struct VideoView: View {
    @State private var autoReplay: Bool = true
    @State private var mute: Bool = false
    @State private var play: Bool = true
    @State private var time: CMTime = .zero

//    var videoPlayer: VideoPlayer
    var url = URL(string: "https://dev-the-locker-room.herokuapp.com/api/posts/video/5e5456f34971070017623a32")
    
    init(url: URL) {
        VideoPlayer.preload(urls: [url])
    }
    
//    VideoPlayer
    
    var body: some View {
        VStack {
            VideoPlayer(url: url!, play: $play, time: $time)
            .autoReplay(autoReplay)
            .mute(mute)
        }
        
//            .onStateChanged { _ in
////                print(_)
//                switch state {
//                case .loading:
//                    // Loading...
//                    Text("Loading")
//                    break
//                case .playing(let totalDuration):
//                    // Playing...
//                    Text("playing \(totalDuration)")
//                    break
//                case .paused(let playProgress, let bufferProgress):
//                    // Paused...
//                    Text("paused \(playProgress) \(bufferProgress)")
//                    break
//                case .error(let error):
//                    // Error...
//                    Text("Error \(error)")
//                    break
//                }
//            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(url: URL(string: "https://eoan.ie/mov/yeehaw.mov")!)
    }
}
