//
//  DefaultProfilePhotoView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct DefaultProfilePhotoView: View {
    var size:Int = 50
    var body: some View {
        Image(systemName: "person.circle.fill")
            .font(.system(size: CGFloat(size)))
            .foregroundColor(Color(.red))
    }
}

struct DefaultProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultProfilePhotoView(size: 50)
    }
}
