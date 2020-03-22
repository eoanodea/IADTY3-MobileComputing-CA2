//
//  PostSocialIconView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct PostSocialIconView: View {
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .font(.largeTitle)
                .padding(5)
            Image(systemName: "bubble.right")
                .font(.largeTitle)
                .padding(5)
        }.padding(10)
    }
}


struct PostSocialIconView_Previews: PreviewProvider {
    static var previews: some View {
        PostSocialIconView()
    }
}
