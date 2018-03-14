//
//  LoggedInVC.swift
//  ChefEV
//
//  Created by Nick Richardson on 9/29/17.
//  Copyright © 2017 Nick Richardson. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoggedInVC: UIViewController {

    @IBAction func logoutTapped(_ sender: Any) {
        
        do {
       try  Auth.auth().signOut()
            
         dismiss(animated: true, completion: nil)
         self.performSegue(withIdentifier: "showLogIn", sender: self)
            
        } catch {
            print("Error signing out")
        }
    }

}
