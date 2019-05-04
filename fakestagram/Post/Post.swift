//
//  Post.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

struct Post: Codable {
    let id: Int?
    let title: String
    let imageUrl: String?
    let author: Author?
    var likesCount: Int
    let commentsCount: Int
    let createdAt: String
    var liked: Bool
    
    mutating func swapLiked() -> Bool {
        self.liked = !self.liked
        return self.liked
    }
    
    func load(_ image: @escaping (UIImage) -> Void) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else {return}
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data){
                DispatchQueue.main.async { image(img) }
            }
        }
    }
    
    func likesCountText() -> String {
        switch likesCount {
        case 1:
            return "\(likesCount) like"
        default:
            return "\(likesCount) likes"
        }
    }
    
    func commentsCountText() -> String {
        switch commentsCount {
        case 1:
            return "\(commentsCount) comment"
        default:
            return "\(commentsCount) comments"
        }
    }
}
