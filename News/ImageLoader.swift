//
//  ImageLoader.swift
//  News
//
//  Created by orangeboy on 2021/5/15.
//

import Foundation
import Combine
class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    var urlString: String = ""
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        self.urlString = urlString
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
    func refresh(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        self.urlString = urlString
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
    init() {
        
    }
    
    
}
