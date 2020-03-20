//
//  ImageView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import URLImage

struct ImageView: View {
    var url:String = ""
    
    var body: some View {
        URLImage(URL(string: url)!,
        placeholder: {
           ProgressView($0) { progress in
               ZStack {
                   if (progress > 0.0 && progress < 1) {
                       CircleProgressView(progress).stroke(lineWidth: 8.0)
                        .foregroundColor(Color(.red))
                   }
                   else if progress == 1 {
                        Image(systemName: "person.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(.red))
                   }
                   else {
                       CircleActivityView().stroke(lineWidth: 50.0)
                        .foregroundColor(Color(.red))
                   }
                }
           }
           .frame(width: 50.0, height: 50.0)
        },
        content: {
           $0.image
               .resizable()
               .aspectRatio(contentMode: .fill)
               .clipShape(Circle())
               .shadow(radius: 10.0)
        })
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://dev-the-locker-room.herokuapp.com/api/users/photo/5df7939d203e230017657219")
    }
}