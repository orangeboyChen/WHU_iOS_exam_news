//
//  NewsListItem.swift
//  News
//
//  Created by orangeboy on 2021/5/16.
//

import SwiftUI

struct NewsListItem: View {
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    @State
    var image = UIImage()
    
    @State
    var isLoadImage: Bool = false
    
    @State
    var news: News
    
    @State
    var update: Bool = false
    
    var body: some View {
        Group {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 60)
                    .onReceive(imageLoader.didChange){ data in
                        self.image = UIImage(data: data) ?? UIImage()
                        update.toggle()
                    }
                
                VStack(alignment: .leading) {
                    Text(news.title)
                    Text(news.passtime).font(.subheadline)
                }
            }

        }.onAppear {
            imageLoader.refresh(urlString: news.image)

        }
    }
    
    

}

struct NewsListItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsListItem(news: News(title: "123456789", path: "123", passtime: "123", image: "123"))
    }
}

