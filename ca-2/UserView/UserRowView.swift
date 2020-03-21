//
//  UserRowView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import URLImage

struct UserRowView: View {
    var userItem: Users
    var photoUrl = "\(baseUrl)users/photo/"
    var fileExists = false

    var body: some View {
        VStack {
            HStack {
                if userItem.hasPhoto ?? true {
                    ImageView(url: "\(photoUrl)\(userItem.id)")
                    .frame(width: 50.0, height: 50.0)
                } else {
                    ImageView()
                    .frame(width: 50.0, height: 50.0)
                }
                Text(userItem.name)
                    .font(.headline)
                Spacer()
            }
        }
    }
    
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(userItem: UsersModel().users[0])
    }
}
