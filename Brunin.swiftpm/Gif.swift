
import SwiftUI
import WebKit

struct Gif: UIViewRepresentable {
    private let resourceName: String
    
    init (resourceName: String) {
    self.resourceName = resourceName
}

    func makeUIView(context: Context) -> WKWebView {
        let wView = WKWebView()
        let url = Bundle.main.url(forResource: resourceName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        wView.load(data, mimeType: "image/gif", characterEncodingName: "UFT-8", baseURL: url.deletingLastPathComponent())
        
        wView.isOpaque = false
        wView.backgroundColor = UIColor.clear
        wView.scrollView.backgroundColor = UIColor.clear
        
        return wView
    
}
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}
