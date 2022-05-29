//
//  MenShoesTableViewCell.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class MenShoesTableViewCell: UITableViewCell {

    var callBackForAddToCart: (()->())?
    var callBackForAddKidShoesInCart: (()->())?
    var callBackForRemoveKidShoesFromCart: (()->())?
    @IBOutlet weak var ivMenShoes: UIImageView!
    @IBOutlet weak var lblMenShoesName: UILabel!
    @IBOutlet weak var lblMenShoesPrice: UILabel!
    @IBOutlet weak var btnAddMenShoes: UIButton!
    @IBOutlet weak var btnRemoveMenShoes: UIButton!
    @IBOutlet weak var lblMenShoesCount: UILabel!
    @IBOutlet weak var lblAddToCart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnAddMenShoesTapped(_ sender: UIButton) {
         self.callBackForAddKidShoesInCart?()
    }
    
    @IBAction func btnRemoveMenShoesTapped(_ sender: UIButton) {
         self.callBackForRemoveKidShoesFromCart?()
    }
    
    @IBAction func btnAddToCart(_ sender: UIButton) {
         self.callBackForAddToCart?()
    }
}
