//
//  SignInVC.swift
//  GlobeApp
//
//  Created by Karthik on 15/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate {

  
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        self.emailTextField.isHidden = false
        self.passwordField.isHidden = false
        self.emailTextField.becomeFirstResponder()
        self.login()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SignInVC.dismissKeyboard)))
        self.emailTextField.delegate = self
        self.passwordField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.emailTextField.isHidden = true
        self.passwordField.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
     func login() {
     let email = emailTextField.text!.lowercased()
     let password = passwordField.text
     
     if email.characters.count == 0 {
     ProgressHUD.showError("Username field is empty.")
     return
     } else {
     ProgressHUD.showError("Password field is empty.")
     }
     
     ProgressHUD.show("Signing in...", interaction: true)
     PFUser.logInWithUsername(inBackground: email, password: password!) { (user, error) in
       
     if user != nil {
    
     ProgressHUD.showSuccess("Welcome back, \(user![PF_USER_FULLNAME])!")
     self.dismiss(animated: true, completion: nil)
     } else {
    
     ProgressHUD.showError("Invalid login parameters")
     }
        
        }
     }
  

}
