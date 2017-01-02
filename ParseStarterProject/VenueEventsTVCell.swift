//
//  VenueEventsTVCell.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 02/01/2017.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class VenueEventsTVCell: UITableViewCell {

    @IBOutlet var eventImageView: UIImageView!
    
    @IBOutlet var eventNameLabel: UILabel!
    
    @IBOutlet var eventDateLabel: UILabel!
    
    @IBAction func bookNowButton(_ sender: Any) {
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
