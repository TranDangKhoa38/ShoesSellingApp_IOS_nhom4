//
//  KidShoesCartViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/26/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class KidShoesCartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tblKidShoesCart: UITableView!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var btnCheckout: UIButton!
    var subTotal:Int = 0
    var cartKidShoesArray: [KidShoes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCheckout.layer.borderWidth = 1
        btnCheckout.layer.borderColor = UIColor.black.cgColor
        tblKidShoesCart.dataSource = self
        tblKidShoesCart.delegate = self
        subTotal = cartKidShoesArray.map{$0.productPrice * $0.productCount}.reduce(0, +)
        lblSubtotal.text = "Subtotal: $\(subTotal)"
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartKidShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "KidShoesCartCell", for: indexPath) as? KidShoesCartTableViewCell{
            cell.lblKidShoesName.text = cartKidShoesArray[indexPath.row].productName
            cell.ivKidShoes.image = UIImage(named: cartKidShoesArray[indexPath.row].imageName)
            cell.lblKidShoesCount.text = "\(cartKidShoesArray[indexPath.row].productCount)x"
            cell.lblkidShoesPrice.text = "\(cartKidShoesArray[indexPath.row].productPrice * cartKidShoesArray[indexPath.row].productCount)"
            return cell
        }
        return UITableViewCell()
    }

}
