//
//  VenueDetailsVC.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 31/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class VenueDetailsVC: UIViewController {
    
    
    @IBOutlet var venueCityLabel: UILabel!
    @IBOutlet var venueNameLabel: UILabel!
    @IBOutlet var venueMainImage: UIImageView!
    
    @IBAction func galleryButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        
         performSegue(withIdentifier: "showEventSegue", sender: self)
    }
    
    @IBAction func offersButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showOffersSegue", sender: self)
    }
    
    @IBOutlet var venueDetailsLabel: UILabel!
    
    @IBOutlet var venueAddressLabel: UILabel!
    
    @IBOutlet var venueTypeLabel: UILabel!
    
    @IBOutlet var venueEmailId: UILabel!
    
    @IBOutlet var venueWebsiteLabel: UILabel!
    
    @IBOutlet var venuePhoneLabel: UILabel!
    
    @IBOutlet var venueContactLabel: UILabel!

    var clubObject:PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cImageFile = clubObject["clubLogo"] as? PFFile
        
        cImageFile?.getDataInBackground { (imageData, error) -> Void in
            
            if error == nil {
                if let imageData = imageData {
                    self.venueMainImage.image = UIImage(data: imageData)
                    
                }
                
            }
        }
        //self.venueMainImage.image = clubObject["clubLogo"] as? UIImage
        self.venueNameLabel.text = clubObject["ClubName"] as? String
        self.venueTypeLabel.text = clubObject["clubType"] as? String
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        

    }
    

}
