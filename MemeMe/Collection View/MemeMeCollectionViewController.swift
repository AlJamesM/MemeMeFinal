//
//  MemeMeCollectionViewController.swift
//  MemeMe
//
//  Created by Al Manigsaca on 3/12/18.
//  Copyright © 2018 axillon. All rights reserved.
//

import UIKit

class MemeMeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Model
    // Reference back to memes model
    var memes: [Meme]! {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
        
    }
    
    // MARK: - Setup
    override func viewDidLoad() {
        
        super.viewDidLoad()
        flowLayoutUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.flowLayoutUpdate()
        self.tabBarController?.tabBar.isHidden = false
        self.collectionView?.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeMeCollectionViewCell", for: indexPath) as! MemeMeCollectionViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        
        if let memedImage = meme.memedImage {
            cell.memeImageView?.image = memedImage
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

        let detailController = storyboard!.instantiateViewController(withIdentifier: "MemeMeViewController") as! MemeMeViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    // MARK: - Misc
    // Update flow layout after rotation
    func flowLayoutUpdate() {
        
        let dimension = (self.view.frame.size.width - (2 * kSpace)) / kNumImages
        self.flowLayout.minimumInteritemSpacing = kSpace
        self.flowLayout.minimumLineSpacing = kSpace
        self.flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in
            
            self.flowLayoutUpdate()
        })
    }
}
