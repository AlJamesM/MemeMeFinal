//
//  AppDelegate.swift
//  MemeMe
//
//  Created by Al Manigsaca on 1/22/18.
//  Copyright © 2018 axillon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Meme array
    var memes = [Meme]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

