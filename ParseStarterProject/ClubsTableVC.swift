//
//  ClubsTableVC.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 16/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class ClubsTableVC: PFQueryTableViewController {
    
    convenience override init(style: UITableViewStyle, className: String!){
        self.init(style: style, className: className)
        
        self.parseClassName = "Venue"
        
        self.textKey = "clubName"
        self.imageKey = "clubLogo"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "Venue")
        
        return query
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "clubCell") as! ClubMainCell!
        
        if cell == nil {
            
            cell = ClubMainCell(style: UITableViewCellStyle.default, reuseIdentifier: "clubCell")
            
        }
        
        if let clubName = object?["clubName"] as? String {
            
            cell?.clubName.text = clubName
            
        }
        
        let tempFile = object?["clubLogo"] as! PFFile
        tempFile.getDataInBackground { (imageData, error) -> Void in
            
            if error == nil {
                
                if let imageData = imageData {
                    
                    cell?.clubImage.image = UIImage(data: imageData)
                    
                }
                
            }
            
        }
        return cell
    }

    

}
