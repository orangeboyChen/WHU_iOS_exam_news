//
//  RemoteImage.swift
//  News
//
//  Created by orangeboy on 2021/5/15.
//

import SwiftUI

struct RemoteImage: View {
    
    @State
    var imageLoader: ImageLoader
    
    @State
    var image: UIImage = UIImage()
    
    @State
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        self.imageLoader = ImageLoader(urlString: urlString)
    }
    
    init() {
        self.urlString = ""
        self.imageLoader = ImageLoader(urlString: "")
    }
    
    var body: some View {
        Group {
            if urlString != "" {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 60)
                    .onReceive(imageLoader.didChange){ data in
                        image = UIImage(data: data) ?? UIImage()
                    }
            }
            else {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 60)
                    .redacted(reason: .placeholder)
            }

        }.onAppear(perform: {
            self.imageLoader = ImageLoader(urlString: self.urlString)
        })

    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(urlString: "http://www.baidu.com")
    }
}
