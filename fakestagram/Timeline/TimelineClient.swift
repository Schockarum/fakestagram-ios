//
//  TimelineClient.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/13/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class TimelineClient: RestClient<[Post]> {
    convenience init() {
        self.init(client: Client(), path: "/api/posts")
    }
    
    func show(page: Int, success: @escaping codableResponse) {
        let items = ["page": String(page)]
        request("GET", path: "\(path)", queryItems: items, payload: nil, success: success, errorHandler: nil)
    }
    
    // show()
    // create()
    // delete()
}
