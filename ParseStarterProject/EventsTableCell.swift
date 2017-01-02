//
//  EventsTableCell.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 01/01/2017.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class EventsTableCell: UITableViewCell {

    @IBOutlet var eventImageView: UIImageView!
    
    @IBOutlet var eventNameLabel: UILabel!
    
    @IBOutlet var eventVenueLable: UILabel!
    
    @IBOutlet var eventTimeLabel: UILabel!
    @IBOutlet var venueDistanceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
