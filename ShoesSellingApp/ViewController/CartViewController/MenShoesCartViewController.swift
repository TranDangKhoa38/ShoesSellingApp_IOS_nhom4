//
//  MenShoesCartViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class MenShoesCartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var tblMenShoesCartList: UITableView!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var btnCheckout: UIButton!
    var subTotal:Int = 0
    var cartMenShoesArray: [MenShoes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCheckout.layer.borderWidth = 1
        btnCheckout.layer.borderColor = UIColor.black.cgColor
        tblMenShoesCartList.delegate = self
        tblMenShoesCartList.dataSource = self
        subTotal = cartMenShoesArray.map{$0.productPrice * $0.productCount}.reduce(0, +)
        lblSubtotal.text = "Subtotal: $\(subTotal)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartMenShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenShoesCartCell", for: indexPath) as? MenShoesCartTableViewCell{
            cell.lblMenShoesName.text = cartMenShoesArray[indexPath.row].productName
            cell.ivMenShoes.image = UIImage(named: cartMenShoesArray[indexPath.row].imageName)
            cell.lblMenShoesCount.text = "\(cartMenShoesArray[indexPath.row].productCount)x"
            cell.lblMenShoesPrice.text = "\(cartMenShoesArray[indexPath.row].productPrice * cartMenShoesArray[indexPath.row].productCount)"
            return cell
        }
        return UITableViewCell()
    }
    
    

}
