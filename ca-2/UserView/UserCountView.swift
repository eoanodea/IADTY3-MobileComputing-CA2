//
//  UserCountView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

//Dynamically displays a number and text
//depending on what information is given to it
//Primary use is profile page following/follower count
struct UserCountView: View {
    var count: Int
    var text: String
    
    var body: some View {
        VStack {
            Text("\(count)")
                .bold()
            Text("\(text)")
                .font(.caption)
        }
    }
}

struct UserCountView_Previews: PreviewProvider {
    static var previews: some View {
        UserCountView(count: 200, text: "Posts")
    }
}
