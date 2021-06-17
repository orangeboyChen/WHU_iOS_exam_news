//
//  News.swift
//  News
//
//  Created by orangeboy on 2021/5/12.
//

import Foundation
class News: Identifiable {
    var title: String
    var path: String
    var passtime: String
    var image: String
    var id: String = UUID().uuidString
    
    init(title: String, path: String, passtime: String, image: String) {
        self.title = title
        self.path = path
        self.passtime = passtime
        self.image = image
    }
}
