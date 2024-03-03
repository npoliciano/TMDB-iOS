//
//  WebView.swift
//  TMDB
//
//  Created by Nicolle on 02/03/24.
//

import SwiftUI
import WebKit

//It turns a Web view into a SwiftUI view
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
