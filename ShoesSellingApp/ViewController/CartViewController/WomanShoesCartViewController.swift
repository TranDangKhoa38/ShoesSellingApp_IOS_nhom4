//
//  WomanShoesCartViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class WomanShoesCartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    

    @IBOutlet weak var tblWomanShoesCartList: UITableView!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var btnCheckout: UIButton!
    var subTotal:Int = 0
    var cartWomanShoesArray: [WomanShoes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCheckout.layer.borderWidth = 1
        btnCheckout.layer.borderColor = UIColor.black.cgColor
        tblWomanShoesCartList.delegate = self
        tblWomanShoesCartList.dataSource = self
        subTotal = cartWomanShoesArray.map{$0.productPrice * $0.productCount}.reduce(0, +)
        lblSubtotal.text = "Subtotal: $\(subTotal)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cartWomanShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WomanShoesCartCell", for: indexPath) as? WomanShoesCartTableViewCell{
            cell.lblWomanShoesName.text = cartWomanShoesArray[indexPath.row].productName
            cell.ivWomanShoes.image = UIImage(named: cartWomanShoesArray[indexPath.row].imageName)
            cell.lblWomanShoesCount.text = "\(cartWomanShoesArray[indexPath.row].productCount)x"
            cell.lblWomanShoesPrice.text = "\(cartWomanShoesArray[indexPath.row].productPrice * cartWomanShoesArray[indexPath.row].productCount)"
            return cell
        }
        return UITableViewCell()
    }
    
}
