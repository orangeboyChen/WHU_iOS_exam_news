//
//  NewsService.swift
//  News
//
//  Created by orangeboy on 2021/5/12.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NewsServiceDelegate {
    mutating func newsDelegate(news: [JSON])
}

class NewsService {
    private static var instance: NewsService = NewsService()
    
    private let NEWS_URL = "https://api.apiopen.top/getWangYiNews"
    
    var delegate: NewsServiceDelegate?
    
    private init() {}
    
    public static func getInstance() -> NewsService {
        return instance
    }
    
    public func getNews(pageNum: Int, pageSize: Int) {
        
        let parameters = ["page": pageNum, "size": pageSize]
        AF.request(NEWS_URL, method: .get, parameters: parameters)
            .responseJSON { response in
                let responseJson = JSON(response.data as Any)
                self.delegate?.newsDelegate(news: responseJson["result"].arrayValue)
            }
    }
}


