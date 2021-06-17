//
//  ContentView.swift
//  News
//
//  Created by orangeboy on 2021/5/10.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View, NewsServiceDelegate {
    mutating func newsDelegate(news: [JSON]) {
        news.forEach { singleNews in
            newsList.append(News(title: singleNews["title"].stringValue, path: singleNews["path"].stringValue, passtime: singleNews["passtime"].stringValue, image: singleNews["image"].stringValue))
        }
        
        print(newsList)
    }
    
    
    @State
    var stateSelection: Int = 1
    
    @State
    var newsList: [News] = []
    
    var navigationTitle = ["", "新闻", "收藏"]
    
    var newsService = NewsService.getInstance()
    
    var body: some View {
        NavigationView {
            TabView(selection: $stateSelection) {
                NewsView(newsList: $newsList).tabItem {
                    Image(systemName: "newspaper")
                    Text(navigationTitle[1])
                }.tag(1)
                LikeView().tabItem {
                    Image(systemName: "star")
                    Text(navigationTitle[2])
                }.tag(2)
            }.onAppear(perform: {
                newsService.delegate = self
                newsService.getNews(pageNum: 1, pageSize: 10)
            }).navigationBarTitle(navigationTitle[stateSelection])
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
