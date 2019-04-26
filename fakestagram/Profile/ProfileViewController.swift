//
//  ProfileViewController.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var authorView: PostAuthorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorView.author = Author(name: "Jojo")
    }
}
