//
//  LikeClient.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class LikeUpdaterClient {
    private let client = Client()
    private let basePath = "/api/posts"
    
    func like(post: Post) -> Int {
        guard let postId = post.id else { return post.likesCount }
        client.request("POST", path: "\(basePath)/\(postId)/like", body: nil, completionHandler: onSuccess(response:data:), errorHandler: onError(error:))
        return post.likesCount + 1
    }
    
    func dislike(post: Post) -> Int {
        guard let postId = post.id else { return post.likesCount }
        client.request("DELETE", path: "\(basePath)/\(postId)/like", body: nil, completionHandler: onSuccess(response:data:), errorHandler: onError(error:))
        return post.likesCount - 1
    }
    
    func onSuccess(response: HTTPResponse, data: Data?) -> Void {
        guard response.successful() else { return }
        //TODO: add observer
        print("!!!")
    }
    
    func onError(error: Error?) -> Void {
        guard let err = error else { return } //Si llega un error, confirmamos que exista
        print("Error on request \(err.localizedDescription)") //& lo imprimimos
    }
}
