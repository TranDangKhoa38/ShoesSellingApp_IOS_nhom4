//
//  KidShoesViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/26/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class KidShoesViewController: UIViewController {

    @IBOutlet weak var tblKidShoesList: UITableView!
    
    var kidShoesArray: [KidShoes] = []
    var tempKidShoes: [KidShoes] = []
    var listOfKidShoes = ListOfKidShoes()
    override func viewDidLoad() {
        super.viewDidLoad()
        kidShoesArray = listOfKidShoes.addProdcutsInToList()
        tblKidShoesList.dataSource = self
        tblKidShoesList.delegate = self
    }
    
    @IBAction func btnCart(_ sender: UIButton) {
        if tempKidShoes.count > 0 {
            performSegue(withIdentifier: "fromKidShoesCart", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromKidShoesCart"{
            let vc = segue.destination as! KidShoesCartViewController
            vc.cartKidShoesArray = tempKidShoes
        }
    }
}
extension KidShoesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kidShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "KidShoesCell", for: indexPath) as? KidShoesTableViewCell{
            cell.lblKidShoesName.text = kidShoesArray[indexPath.row].productName
            cell.KidShoesPrice.text = "\(kidShoesArray[indexPath.row].productPrice)"
            cell.ivKidShoes.image = UIImage(named: kidShoesArray[indexPath.row].imageName)
            cell.btnAddToCart.isHidden = self.kidShoesArray[indexPath.row].isProductAddedToCart
            cell.callBackForAddToCart = {
                self.kidShoesArray[indexPath.row].isProductAddedToCart = true
                cell.btnAddToCart.isHidden = true
                self.tempKidShoes.append(self.kidShoesArray[indexPath.row])
            }
            cell.lblKidShoesCount.text = "\(kidShoesArray[indexPath.row].productCount)"
            cell.callBackForAddKidShoesInCart = {
                self.kidShoesArray[indexPath.row].productCount += 1
                cell.lblKidShoesCount.text = "\(self.kidShoesArray[indexPath.row].productCount)"
            }
            cell.callBackForRemoveKidShoesFromCart = {
                if self.kidShoesArray[indexPath.row].productCount > 1{
                    self.kidShoesArray[indexPath.row].productCount -= 1
                    cell.lblKidShoesCount.text = "\(self.kidShoesArray[indexPath.row].productCount)"
                }else{
                    self.kidShoesArray[indexPath.row].productCount = 0
                    cell.btnAddToCart.isHidden = false
                    self.tempKidShoes.remove(at: indexPath.row)
                    cell.lblKidShoesCount.text = "\(self.kidShoesArray[indexPath.row].productCount)"
                }
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}
