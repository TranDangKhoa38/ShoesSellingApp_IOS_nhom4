//
//  NewShoesViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/28/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit
var newShoes:KidShoes = KidShoes()
class NewShoesViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var ivShoes: UIImageView!
    @IBOutlet weak var txtShoesName: UITextField!
    @IBOutlet weak var txtShoesPrice: UITextField!
    var newShoes = KidShoes()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSaveTapped(_ sender: UIButton) {
        let shoesName = txtShoesName.text!
        let shoesPrice = Int(txtShoesPrice.text!)
        if shoesName == "" || shoesPrice! < 0 {
            let alertController = UIAlertController(title: "Alert", message: "Please set shoes", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }else{
            newShoes = KidShoes(imageName: shoesName, productName: shoesName, productPrice: shoesPrice!, isProductAddedToCart: false, productCount: 0)
            shoesArr.append(newShoes)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? AdminViewController
            mainViewController?.tblShoesList?.reloadData()
        }
        /*
        if(newShoes.productName == "z"){
            let alertController = UIAlertController(title: "Alert", message: "Please set shoes", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
               
            }
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }else{
            
            shoesArr.append(newShoes)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? AdminViewController
            mainViewController?.tblShoesList?.reloadData()
            
        }
        */
    }

}
