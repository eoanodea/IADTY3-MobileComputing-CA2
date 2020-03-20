//
//  UserRowView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import URLImage

//var baseUrl: String = Bundle.main.infoDictionary!["BASE_URL"] as! String

struct UserRowView: View {
    var userItem: Users
    var photoUrl = "\(baseUrl)users/photo/"
    
    var body: some View {
        VStack {
            HStack {
                ImageView(url: "\(photoUrl)\(userItem.id)", delay: 0.25)
                    .frame(width: 100.0, height: 100.0)
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
