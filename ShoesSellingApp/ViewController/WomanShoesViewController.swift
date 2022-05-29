//
//  WomanShoesViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class WomanShoesViewController: UIViewController {

    @IBOutlet weak var tblWomanShoesList: UITableView!
    var womanShoesArray: [WomanShoes] = []
    var tempWomanShoes: [WomanShoes] = []
    var listOfWomanShoes = ListOfWomanShoes()
    override func viewDidLoad() {
        super.viewDidLoad()
        womanShoesArray = listOfWomanShoes.addProdcutsInToList()
        tblWomanShoesList.dataSource = self
        tblWomanShoesList.delegate = self
    }
    
    @IBAction func btnCart(_ sender: UIButton) {
        if tempWomanShoes.count > 0 {
            performSegue(withIdentifier: "fromWomanShoes", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromWomanShoes"{
            let vc = segue.destination as! WomanShoesCartViewController
            vc.cartWomanShoesArray = tempWomanShoes
        }
    }
    
}
extension WomanShoesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return womanShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WomanShoesCell", for: indexPath) as? WomanShoesTableViewCell{
            cell.lblWomanShoesName.text = womanShoesArray[indexPath.row].productName
            cell.lblWomanShoesPrice.text = "\(womanShoesArray[indexPath.row].productPrice)"
            cell.ivWomanShoes.image = UIImage(named: womanShoesArray[indexPath.row].imageName)
            cell.btnAddToCart.isHidden = self.womanShoesArray[indexPath.row].isProductAddedToCart
            cell.callBackForAddToCart = {
                self.womanShoesArray[indexPath.row].isProductAddedToCart = true
                cell.btnAddToCart.isHidden = true
                self.tempWomanShoes.append(self.womanShoesArray[indexPath.row])
            }
            cell.lblWomanShoesCount.text = "\(womanShoesArray[indexPath.row].productCount)"
            cell.callBackForAddKidShoesInCart = {
                self.womanShoesArray[indexPath.row].productCount += 1
                cell.lblWomanShoesCount.text = "\(self.womanShoesArray[indexPath.row].productCount)"
            }
            cell.callBackForRemoveKidShoesFromCart = {
                if self.womanShoesArray[indexPath.row].productCount > 1{
                    self.womanShoesArray[indexPath.row].productCount -= 1
                    cell.lblWomanShoesCount.text = "\(self.womanShoesArray[indexPath.row].productCount)"
                }else{
                    self.womanShoesArray[indexPath.row].productCount = 0
                    cell.btnAddToCart.isHidden = false
                    self.tempWomanShoes.remove(at: indexPath.row)
                    cell.lblWomanShoesCount.text = "\(self.womanShoesArray[indexPath.row].productCount)"
                }
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}
