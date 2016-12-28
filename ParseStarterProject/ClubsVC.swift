//
//  ClubsVC.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 28/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit


class ClubsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var clubsTable: UITableView!
    
    var clubsArray = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

       let clubQuery = PFQuery(className: "Club")
        
        clubQuery.findObjectsInBackground { (objects, error) in
            
            if error == nil {
                
           self.clubsArray.append(contentsOf: objects!)
                 print(self.clubsArray)
                
                self.clubsTable.reloadData()
            
            } else {
                    
                    print(error!)
                }
        }
       
        print("pudiki")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return self.clubsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cCell = tableView.dequeueReusableCell(withIdentifier: "clubsCell", for: indexPath) as! ClubsTVCell
        
        let pfObject = self.clubsArray[indexPath.item] as PFObject
        
        cCell.clubNameLabel?.text = pfObject["ClubName"] as? String
        let cImageFile = pfObject["clubLogo"] as? PFFile
        cImageFile?.getDataInBackground { (imageData, error) -> Void in
            
            if error == nil {
                if let imageData = imageData {
                    cCell.clubLogoImage.image = UIImage(data: imageData)
                    
                }
                
            }
        }

        
        return cCell
        
    }
}
