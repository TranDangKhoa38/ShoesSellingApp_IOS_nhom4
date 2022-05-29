//
//  AdminShoesTableTableViewCell.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/28/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class AdminShoesTableTableViewCell: UITableViewCell {

    @IBOutlet weak var ivShoesImage: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblShoesName: UILabel!
    @IBOutlet weak var lblShoesPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
