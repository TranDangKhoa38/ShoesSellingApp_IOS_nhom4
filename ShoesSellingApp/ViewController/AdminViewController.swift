//
//  AdminViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/28/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tblShoesList: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClick(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "emailA")
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        let navVC = UINavigationController(rootViewController: vc!)
        let share = UIApplication.shared.delegate as? AppDelegate
        share?.window?.rootViewController = navVC
        share?.window?.makeKeyAndVisible()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoesCell") as! AdminShoesTableTableViewCell
        let kidShoes:KidShoes = shoesArr[indexPath.row]
        cell.lblShoesName.text = kidShoes.productName
        cell.ivShoesImage.image = UIImage(named: kidShoes.imageName)
        cell.lblShoesPrice.text = "$\(kidShoes.productPrice)"
        
            return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Delete", message: "Do you want to delete \(shoesArr[indexPath.row].productName)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                tableView.beginUpdates()
                shoesArr.remove(at: indexPath.row)
                self.tblShoesList.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
                self.tblShoesList.reloadRows(at: [indexPath], with: .right)
            }
            alert.addAction(ok)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
          
        }
    }
}

