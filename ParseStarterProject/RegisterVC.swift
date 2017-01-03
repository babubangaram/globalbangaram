//
//  RegisterVC.swift
//  GlobeApp
//
//  Created by Karthik on 15/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameBox: UITextField!
   
    @IBOutlet var emailIdBox: UITextField!
    
    @IBOutlet var passBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
            self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegisterVC.dismissKeyboard)))
            self.nameBox.delegate = self
            self.emailIdBox.delegate = self
            self.passBox.delegate = self
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.nameBox.becomeFirstResponder()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func dismissKeyboard() {
            self.view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == self.nameBox {
                self.emailIdBox.becomeFirstResponder()
            } else if textField == self.emailIdBox {
                self.passBox.becomeFirstResponder()
            } else if textField == self.passBox {
                self.register()
            }
            return true
        }
        
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        self.register()
    }
//        @IBAction func registerButtonPressed(sender: UIButton) {
//            self.register()
//        }
        
        func register() {
            let name = nameBox.text
            let email = emailIdBox.text
            let password = passBox.text?.lowercased()
            
            if name?.characters.count == 0 {
                ProgressHUD.showError("Name must be set.")
                return
            }
            if password?.characters.count == 0 {
                ProgressHUD.showError("Password must be set.")
                return
            }
            if email?.characters.count == 0 {
                ProgressHUD.showError("Email must be set.")
                return
            }
            
            ProgressHUD.show("Please wait...", interaction: false)
            
            let user = PFUser()
            user.username = email
            user.password = password
            user.email = email
            user[PF_USER_EMAILCOPY] = email
            user[PF_USER_FULLNAME] = name
            user[PF_USER_FULLNAME_LOWER] = name?.lowercased()
            
            user.signUpInBackground { (success, error) -> Void in
                
               
                // user.signUpInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
                if error == nil {
                   // PushNotication.parsePushUserAssign()
                    ProgressHUD.showSuccess("Succeeded.")
                    self.dismiss(animated: true, completion: nil)
                } else {
                    if let errorString = (error as! NSError).userInfo["error"] as? String {
                        NSLog(errorString);
                        ProgressHUD.showError((error as! NSError).userInfo["error"] as? String)
                    }
                }
            }
        }
        

}
