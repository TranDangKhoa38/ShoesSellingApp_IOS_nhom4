//
//  KidShoesTableViewCell.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/26/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class KidShoesTableViewCell: UITableViewCell {
    
    var callBackForAddToCart: (()->())?
    var callBackForAddKidShoesInCart: (()->())?
    var callBackForRemoveKidShoesFromCart: (()->())?
    @IBOutlet weak var lblKidShoesName: UILabel!
    @IBOutlet weak var KidShoesPrice: UILabel!
    @IBOutlet weak var btnAddKidShoes: UIButton!
    @IBOutlet weak var btnRemoveKidShoes: UIButton!
    @IBOutlet weak var lblKidShoesCount: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var ivKidShoes: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnKidShoesAddTapped(_ sender: UIButton) {
        self.callBackForAddKidShoesInCart?()
    }
    
    @IBAction func btnKidShoesRemoveTapped(_ sender: UIButton) {
        self.callBackForRemoveKidShoesFromCart?()
    }
    
    @IBAction func btnAddToCart(_ sender: UIButton) {
        self.callBackForAddToCart?()
    }
    
}
