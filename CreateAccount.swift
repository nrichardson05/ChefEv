//
//  CreateAccount.swift
//  
//
//  Created by Nick Richardson on 1/21/18.
//

import UIKit
import FirebaseAuth
import QuartzCore
import FirebaseDatabase
import Firebase

class CreateAccount: UIViewController {
    
    var refUsers: DatabaseReference!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextField: UITextField!

    
    
    
    
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    @IBOutlet weak var firstNameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var addressErrorLabel: UILabel!
    @IBOutlet weak var cityErrorLabel: UILabel!
    @IBOutlet weak var zipCodeErrorLabel: UILabel!
    
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
         performSegue(withIdentifier: "showLoginScreen", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refUsers = Database.database().reference().child("Users");
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if Auth.auth().currentUser != nil {
     
            print("success")
            
            self.presentMainScreen()
        }
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                } else {
                   
                    if (self.firstNameTextField.text?.isEmpty)! {
                        self.firstNameErrorLabel.text = "first name missing"
                        self.self.firstNameErrorLabel.isHidden = false
                    }
                        
                    else if (self.lastNameTextField.text?.isEmpty)! {
                        self.lastNameErrorLabel.text = "last name missing"
                        self.lastNameErrorLabel.isHidden = false
                    }
                        
                    else if (self.emailTextField.text?.isEmpty)! {
                        self.emailErrorLabel.text = "email missing"
                        self.emailErrorLabel.isHidden = false
                    }
                        
                    else if (self.passwordTextField.text?.isEmpty)! {
                        self.passwordErrorLabel.text = "password missing"
                        self.passwordErrorLabel.isHidden = false
                    }
                        
                    else if (self.confirmPasswordTextField.text?.isEmpty)! {
                        self.confirmPasswordErrorLabel.text = "password confirmation missing"
                        self.confirmPasswordErrorLabel.isHidden = false
                    }
                        
                    else if (self.passwordTextField.text != self.confirmPasswordTextField.text) {
                        self.confirmPasswordErrorLabel.text = "Passwords don't match, try again!"
                        self.confirmPasswordErrorLabel.isHidden = false
                    } else {
 
                    self.addUser()
                  
                    self.presentMainScreen()
            }
        }
                
                
                
            })
            
        }
    }
    
    func addUser(){
        let key = refUsers.childByAutoId().key
        let user = ["id":key,
                    "FirstName":firstNameTextField.text! as String,
                    "LastName":lastNameTextField.text! as String,
                    "PhoneNumber":phoneNumberTextField.text! as String,
                    "Address":addressTextField.text! as String,
                    "City":cityTextField.text! as String,
                    "ZipCode":zipCodeTextField.text! as String
                    ]
        let childUpdates = ["/user/\(key)": user]
        refUsers.updateChildValues(childUpdates)
       // refUsers.child(key).setValue(user)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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
