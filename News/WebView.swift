//
//  WebView.swift
//  News
//
//  Created by orangeboy on 2021/6/17.
//

import SwiftUI
import WebKit

struct WebView: View {
    let url: String
    var body: some View {
        WebContainer(url: URL(string: url)!)
    }
}

struct WebContainer: UIViewRepresentable {
    let url: URL
    let navigationHelper = WebViewHelper()

    func makeUIView(context: UIViewRepresentableContext<WebContainer>) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = navigationHelper

        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<WebContainer>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}

class WebViewHelper: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.performDefaultHandling, nil)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "http://www.baidu.com")
    }
}
