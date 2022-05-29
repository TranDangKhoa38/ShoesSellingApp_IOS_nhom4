//
//  RegisterViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/28/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtfName: UITextField!
    @IBOutlet weak var txtlName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var newUser:User = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnRegisterTapped(_ sender: UIButton) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        if email == "" || password == ""{
            let alertController = UIAlertController(title: "Alert", message: "Please set email or password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }else{
            for i in 0...userArr.count - 1{
                if email == userArr[i].email{
                    let alertController = UIAlertController(title: "Alert", message: "Please set email or password", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                        
                    }
                    alertController.addAction(ok)
                    self.present(alertController, animated: true, completion: nil)
                    break
                }
                newUser = User(email: email, password: password)
                userArr.append(newUser)
                navigationController?.popViewController(animated: true)
                _ = self.navigationController?.topViewController as? LoginViewController
            }
        }
    }
}
