//
//  WomanShoesTableViewCell.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class WomanShoesTableViewCell: UITableViewCell {

    var callBackForAddToCart: (()->())?
    var callBackForAddKidShoesInCart: (()->())?
    var callBackForRemoveKidShoesFromCart: (()->())?
    @IBOutlet weak var ivWomanShoes: UIImageView!
    @IBOutlet weak var lblWomanShoesName: UILabel!
    @IBOutlet weak var lblWomanShoesPrice: UILabel!
    @IBOutlet weak var btnAddWomanShoes: UIButton!
    @IBOutlet weak var btnRemoveWomanShoes: UIButton!
    @IBOutlet weak var lblWomanShoesCount: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnAddWomanShoesTapped(_ sender: UIButton) {
         self.callBackForAddKidShoesInCart?()
    }
    
    @IBAction func btnRemoveWomanShoesTapped(_ sender: UIButton) {
        self.callBackForRemoveKidShoesFromCart?()
    }
    
    @IBAction func btnAddToCartTapped(_ sender: UIButton) {
        self.callBackForAddToCart?()
    }
}
