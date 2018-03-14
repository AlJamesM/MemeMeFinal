//
//  MemeMeDetailViewController.swift
//  MemeMe
//
//  Created by Al Manigsaca on 3/14/18.
//  Copyright © 2018 axillon. All rights reserved.
//

import UIKit

class MemeMeDetailViewController: UIViewController {

    @IBOutlet weak var memedImageView: UIImageView!
    var meme = Meme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        
        memedImageView.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func editMemePressed(_ sender: UIBarButtonItem) {
        let editMemeController = storyboard!.instantiateViewController(withIdentifier: "MemeMeViewController") as! MemeMeViewController
        editMemeController.meme = meme
        self.navigationController!.present(editMemeController, animated: true)
    }
}
