

import UIKit


class ProfileViewController: UIViewController, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var userImageView: PFImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if PFUser.current() != nil {
            self.loadUser()
        } else {
            Utilities.loginUser(target: self)
        }
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2;
        userImageView.layer.masksToBounds = true;
        imageButton.layer.cornerRadius = userImageView.frame.size.width / 2;
        imageButton.layer.masksToBounds = true;
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func loadUser() {
        let user = PFUser.current()
        
        userImageView.file = user?[PF_USER_PICTURE] as? PFFile
        
        userImageView.load { (image, error) in
         
            if error != nil {
                print(error!)
            }
        }
        
        nameField.text = user?[PF_USER_FULLNAME] as? String
    }
    
    func saveUser() {
        let fullName = nameField.text
        if (fullName?.characters.count)! > 0 {
            let user = PFUser.current()
            
            user?[PF_USER_FULLNAME] = fullName
            user?[PF_USER_FULLNAME_LOWER] = fullName?.lowercased()
            
            user?.saveInBackground(block: { (success, error) in
                         //user?.saveInBackgroundWithBlock({ (succeeded: Bool, error: NSError!) -> Void in
                if error == nil {
                    ProgressHUD.showSuccess("Saved")
                } else {
                    ProgressHUD.showError("Network error")
                }
            })
        } else {
            ProgressHUD.showError("Name field must not be empty")
        }
    }
    
    // MARK: - User actions
    
    func cleanup() {
        userImageView.image = UIImage(named: "profile_blank")
        nameField.text = nil;
    }
    
    func logout() {
        var actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Log out")
        actionSheet.show(from: (self.tabBarController?.tabBar)!)
    }
    
    @IBAction func logoutButtonPressed(sender: UIBarButtonItem) {
        self.logout()
    }
    
    // MARK: - UIActionSheetDelegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != actionSheet.cancelButtonIndex {
            PFUser.logOut()
           // PushNotication.parsePushUserResign()
            Utilities.postNotification(notification: NOTIFICATION_USER_LOGGED_OUT)
            self.cleanup()
            Utilities.loginUser(target: self)
        }
    }
    
//    @IBAction func photoButtonPressed(sender: UIButton) {
//        camera.shouldStartPhotoLibrary(self, canEdit: true)
//    }
    
    @IBAction func saveButtonPressed(sender: UIButton) {
        self.dismissKeyboard()
        self.saveUser()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//        var image = info[UIImagePickerControllerEditedImage] as! UIImage
//        if image.size.width > 280 {
//            image = Images.resizeImage(image, width: 280, height: 280)!
//        }
//    
//        var pictureFile = PFFile(name: "picture.jpg", data: UIImageJPEGRepresentation(image, 0.6))
//    
//    
//    
//    //pictureFile.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
//            if error != nil {
//                ProgressHUD.showError("Network error")
//            }
//        }
//        
//        userImageView.image = image
//        
//        if image.size.width > 60 {
//            image = Images.resizeImage(image, width: 60, height: 60)!
//        }
//        
//        var thumbnailFile = PFFile(name: "thumbnail.jpg", data: UIImageJPEGRepresentation(image, 0.6))
//        thumbnailFile.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
//            if error != nil {
//                ProgressHUD.showError("Network error")
//            }
//        }
//        
//        var user = PFUser.currentUser()
//        user[PF_USER_PICTURE] = pictureFile
//        user[PF_USER_THUMBNAIL] = thumbnailFile
//        user.saveInBackgroundWithBlock { (succeeded: Bool, error: NSError!) -> Void in
//            if error != nil {
//                ProgressHUD.showError("Network error")
//            }
//        }
//        
//        picker.dismissViewControllerAnimated(true, completion: nil)
//    }
    
}
