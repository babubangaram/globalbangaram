//
//  OffersViewCell.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 01/01/2017.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class OffersViewCell: UITableViewCell {
    
    @IBOutlet var offerImageView: UIImageView!
    
    @IBOutlet var offerTitleLabel: UILabel!
    @IBOutlet var venueNameLabel: UILabel!
    @IBOutlet var offerDescLabel: UILabel!
    
    @IBOutlet var offerDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
