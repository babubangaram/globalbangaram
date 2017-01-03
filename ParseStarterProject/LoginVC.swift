//
//  LoginVC.swift
//  GlobeApp
//
//  Created by Karthik on 15/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse


class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailIdField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action : #selector(UIInputViewController.dismissKeyboard)))
        self.emailIdField.delegate = self
        self.passwordField.delegate = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.emailIdField.becomeFirstResponder()
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailIdField {
            self.passwordField.becomeFirstResponder()
        } else if textField == self.passwordField {
            self.login()
        }
        return true
    }
    
    func login() {
        let email = emailIdField.text?.lowercased()
        let password = passwordField.text
        
        if email?.characters.count == 0 {
            
        ProgressHUD.showError("Email field is empty.")
            
            return
        } else {
          
            ProgressHUD.showError("Password field is empty.")
        }
        
       
            ProgressHUD.show("Signing in...", interaction: true)
        
        PFUser.logInWithUsername(inBackground: email!, password: password!) { (user,  error) in
            
        
   if user != nil {
               // PushNotication.parsePushUserAssign()
    
                    ProgressHUD.showSuccess("Welcome back, \(user?[PF_USER_FULLNAME])!")
    
                self.dismiss(animated: true, completion: nil)
            } else {
    
                   ProgressHUD.showError("error")
    
            }
        }
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

}
