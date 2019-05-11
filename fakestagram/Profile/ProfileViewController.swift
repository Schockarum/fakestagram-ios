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
    @IBOutlet weak var previewPostsCollectionView: UICollectionView!
    
    var posts = [Post]()
    
    let client = ProfilePostsClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        loadAuthor()
        
        client.show { [weak self] posts in
            self?.posts =  posts
            self?.previewPostsCollectionView.reloadData()
        }
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func configCollectionView() {
        previewPostsCollectionView.delegate = self
        previewPostsCollectionView.dataSource = self
        let postThumbnailViewCellXib = UINib(nibName: String(describing: PostThumbnailCollectionViewCell.self), bundle: nil)
        previewPostsCollectionView.register(postThumbnailViewCellXib, forCellWithReuseIdentifier: PostThumbnailCollectionViewCell.reuseIdentifier)
        
    }
    
    func loadAuthor() {
        guard let acc = AccountRepo.shared.load() else { return }
        authorView.author = acc.toAuthor()
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.previewPostsCollectionView.frame.width / 3.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostThumbnailCollectionViewCell.reuseIdentifier, for: indexPath) as! PostThumbnailCollectionViewCell
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
}
