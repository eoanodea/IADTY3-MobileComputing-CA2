//
//  UserDetailView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    var userItem: Users
    var body: some View {
        Text("Hello, \(userItem.name)!")
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userItem: UsersModel().users[0])
    }
}
