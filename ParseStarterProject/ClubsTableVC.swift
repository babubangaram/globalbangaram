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
        
        self.parseClassName = "Club"
        
//        self.textKey = "ClubName"
//        self.imageKey = "clubLogo"
//        self.pullToRefreshEnabled = true
//        self.paginationEnabled = false
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func queryForTable() -> PFQuery<PFObject> {
        
        var query = PFQuery(className: "Club")
        
        
        return query
        
    }
    

}
