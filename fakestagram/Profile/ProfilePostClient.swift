//
//  ProfilePostClient.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 5/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class ProfilePostsClient: RestClient<[Post]> {
    convenience init() {
        self.init(client: Client(), path: "/api/profile/posts")
    }
}
