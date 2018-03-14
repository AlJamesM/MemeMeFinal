//
//  MemeMeTableViewController.swift
//  MemeMe
//
//  Created by Al Manigsaca on 3/12/18.
//  Copyright © 2018 axillon. All rights reserved.
//

import UIKit

class MemeMeTableViewController: UITableViewController  {

    // MARK: - Model
    // Reference back to memes model
    var memes: [Meme]! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60.0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell") as! MemeMeTableViewCell
        let meme = memes[(indexPath as NSIndexPath).row]

        if let topText = meme.topText {
            cell.topText?.text = topText
        }
        
        if let bottomText = meme.bottomText {
            cell.bottomText?.text = bottomText
        }
        
        if let memedImage = meme.memedImage {
            cell.memeImageView?.image = memedImage
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! MemeMeDetailViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(detailController, animated: true)
    }
}
