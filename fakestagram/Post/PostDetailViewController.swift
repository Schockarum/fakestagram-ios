//
//  PostDetailViewController.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    public var post: Post!
    
    @IBOutlet weak var authorView: PostAuthorView!
    @IBOutlet weak var imgView: UIScrollView!
    @IBOutlet weak var titleLbl: UITextView!
    @IBOutlet weak var likeCounterLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
