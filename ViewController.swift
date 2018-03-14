//
//  ViewController.swift
//  ChefEV
//
//  Created by Nick Richardson on 9/28/17.
//  Copyright © 2017 Nick Richardson. All rights reserved.
//

import UIKit
import FirebaseAuth
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if Auth.auth().currentUser != nil {
            print("success")
            
             self.presentMainScreen()
        }
    }

    @IBAction func creatAccountTapped(_ sender: Any) {
        
        
        performSegue(withIdentifier: "showCreateAccount", sender: self)
        
    
        
    //    if let email = emailTextField.text, let password = passwordTextField.text {
            
      //      Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
        //        if let firebaseError = error {
          //      print(firebaseError.localizedDescription)
            //    return
              //  }
                //print("success")
              // self.presentMainScreen()
               
        //})
        
   // }
}
    
@IBAction func loginButtonTapped(_ sender: Any) {
 
    
    
if let email = emailTextField.text, let password = passwordTextField.text {
    
    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
        if let firebaseError = error {
            print(firebaseError.localizedDescription)
            return
         }
        
       print("success")
      
       self.presentMainScreen()
        
    })
    
    }
    
  }
    
    func presentMainScreen(){
        let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabController = mainstoryboard.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        mainTabController.selectedViewController = mainTabController.viewControllers?[0]
        self.present(mainTabController, animated: true, completion: nil)
        //let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        //let loggedInVC:LoggedInVC = storyboard.instantiateViewController(withIdentifier: "LoggedInVC") as! LoggedInVC
        //self.present(loggedInVC, animated: true, completion: nil)
    }
    
}

