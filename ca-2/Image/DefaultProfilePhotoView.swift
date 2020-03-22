//
//  DefaultProfilePhotoView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

/**
    Default Profile Photo for a user
    Can also dynamically change it's icon and size,
     depending on props provided
 */
struct DefaultProfilePhotoView: View {
    var size:Int = 50
    var iconName:String = "person.circle.fill"
    var body: some View {
        Image(systemName: "person.circle.fill")
            .font(.system(size: CGFloat(size)))
            .foregroundColor(Color(.red))
    }
}

struct DefaultProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultProfilePhotoView(size: 50, iconName: "person.circle.fill")
    }
}
