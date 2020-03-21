//
//  PostImageView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import URLImage

struct PostImageView: View {
    var url:String = ""
    var size:Int = 100
    
    var body: some View {
        ZStack {
            if(url == "") {
                DefaultProfilePhotoView(size: 150, iconName: "nosign")
            } else {
                URLImage(URL(string: url)!,
                placeholder: {
                   ProgressView($0) { progress in
                       ZStack {
                           if (progress > 0.0 && progress < 1) {
                               CircleProgressView(progress)
                                .stroke(lineWidth: 5.0)
                                .foregroundColor(Color(.red))
                           } else if progress == 1 {
                            DefaultProfilePhotoView(size: self.size)
                           } else {
                            CircleActivityView()
                                .stroke(lineWidth: 4.0)
                                .foregroundColor(Color(.red))
                           }
                        }                        .animation(.easeIn(duration: 0.2))
                   }
                   .frame(width: 50.0, height: 50.0)
                },
                content: {
                        $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .shadow(radius: 10.0)
                })
            }
        }
    }
}

struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView()
    }
}
