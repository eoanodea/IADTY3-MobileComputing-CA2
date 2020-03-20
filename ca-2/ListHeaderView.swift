//
//  ListHeaderView.swift
//  ca-2
//
//  Created by Eoan on 20/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    var title: String
    var body: some View {
        VStack {
            Text(title)
                .padding([.leading, .top, .bottom], 30)
        }
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(title: "Users")
    }
}
