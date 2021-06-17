//
//  NewListView.swift
//  News
//
//  Created by orangeboy on 2021/5/11.
//

import SwiftUI
import SwiftyJSON


struct NewsView: View {
    
    @Binding
    var newsList: [News]

    
    var body: some View {
        Group {
            List(self.newsList, id: \.self.id) { item in
                NavigationLink(destination: WebView(url: item.path)) {
                    NewsListItem(news: item)
                        .padding(.vertical, 5.0).navigationBarTitle("新闻")
                }

            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsList: .constant([]))
    }
}



