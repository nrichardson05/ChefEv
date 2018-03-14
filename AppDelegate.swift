//
//  AppDelegate.swift
//  ChefEV
//
//  Created by Nick Richardson on 9/28/17.
//  Copyright © 2017 Nick Richardson. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        FirebaseApp.configure()
        return true
    }

   
}

