//
//  PostVideoView.swift
//  ca-2
//
//  Created by Eoan on 21/03/2020.
//  Copyright © 2020 WebSpace. All rights reserved.
//

import SwiftUI
import AVKit
import WebKit

struct PostVideoView: View {
    var url: String = ""
    @State var isOpen: Bool = false

    func openVideo() {
        isOpen = true
    }
    
    var body: some View {
        VStack {
            if(url == "") {
                PostRowVideoView(icon: "nosign")
            } else {
                Button(action: openVideo) {
                    PostRowVideoView(icon: "play.circle")
                }.sheet(isPresented: $isOpen) {
                    WebView(request: URLRequest(url: URL(string: self.url)!))
                }
                    Spacer()
                }
            }
            
    }
}


struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

}

struct PostVideoView_Previews: PreviewProvider {
    static var previews: some View {
        PostVideoView(url: "")
    }
}
