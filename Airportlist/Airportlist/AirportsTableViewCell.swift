//
//  AirportTableViewCell.swift
//  Airportlist
//
//  Created by mac on 2017/5/31.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class AirportsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AirportShortName: UILabel!
    @IBOutlet weak var AirportIATA: UILabel!
    @IBOutlet weak var AirportCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
