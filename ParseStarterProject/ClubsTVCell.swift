//
//  ClubsTVCell.swift
//  GlobeApp
//
//  Created by SRIKARTHIK on 28/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class ClubsTVCell: UITableViewCell {

    @IBOutlet var clubLogoImage: UIImageView!
    
    @IBOutlet var clubNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
