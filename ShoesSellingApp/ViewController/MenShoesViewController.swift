//
//  MenShoesViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class MenShoesViewController: UIViewController {

    var menShoesArray: [MenShoes] = []
    var tempMenShoes: [MenShoes] = []
    var listOfMenShoes = ListOfMenShoes()
    @IBOutlet weak var tblMenShoesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menShoesArray = listOfMenShoes.addProdcutsInToList()
        tblMenShoesList.dataSource = self
        tblMenShoesList.delegate = self
        
    }

    @IBAction func btnCart(_ sender: UIButton) {
        if tempMenShoes.count > 0 {
            performSegue(withIdentifier: "fromMenShoes", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromMenShoes"{
            let vc = segue.destination as! MenShoesCartViewController
            vc.cartMenShoesArray = tempMenShoes
        }
    }
}
extension MenShoesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menShoesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenShoesCell", for: indexPath) as? MenShoesTableViewCell{
            cell.lblMenShoesName.text = menShoesArray[indexPath.row].productName
            cell.lblMenShoesPrice.text = "\(menShoesArray[indexPath.row].productPrice)"
            cell.ivMenShoes.image = UIImage(named: menShoesArray[indexPath.row].imageName)
            cell.lblAddToCart.isHidden = self.menShoesArray[indexPath.row].isProductAddedToCart
            cell.callBackForAddToCart = {
                self.menShoesArray[indexPath.row].isProductAddedToCart = true
                cell.lblAddToCart.isHidden = true
                self.tempMenShoes.append(self.menShoesArray[indexPath.row])
            }
            cell.lblMenShoesCount.text = "\(menShoesArray[indexPath.row].productCount)"
            cell.callBackForAddKidShoesInCart = {
                self.menShoesArray[indexPath.row].productCount += 1
                cell.lblMenShoesCount.text = "\(self.menShoesArray[indexPath.row].productCount)"
            }
            cell.callBackForRemoveKidShoesFromCart = {
                if self.menShoesArray[indexPath.row].productCount > 1{
                    self.menShoesArray[indexPath.row].productCount -= 1
                    cell.lblMenShoesCount.text = "\(self.menShoesArray[indexPath.row].productCount)"
                }else{
                    self.menShoesArray[indexPath.row].productCount = 0
                    cell.lblAddToCart.isHidden = false
                    self.tempMenShoes.remove(at: indexPath.row)
                    cell.lblMenShoesCount.text = "\(self.menShoesArray[indexPath.row].productCount)"
                }
            }
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}
