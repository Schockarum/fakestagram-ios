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
}
