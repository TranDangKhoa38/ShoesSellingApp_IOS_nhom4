//
//  LoginViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let email = "abc@gmail.com"
    let password = "123456"
    let emailA = "admin@gmail.com"
    let passwordA = "admin123"
    let user:User = User()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
  
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        for i in 0...userArr.count - 1{
            if userArr[i].email == txtEmail.text! && userArr[i].password == txtPassword.text!{
                UserDefaults.standard.set(txtEmail.text!, forKey: "email")
                let vc = storyboard?.instantiateViewController(withIdentifier: "HomePage")
                navigationController?.pushViewController(vc!, animated: true)
                break
            }
        }
       if emailA == txtEmail.text! && passwordA == txtPassword.text!{
            UserDefaults.standard.set(txtEmail.text!, forKey: "emailA")
            let vc = storyboard?.instantiateViewController(withIdentifier: "adminPage")
            navigationController?.pushViewController(vc!, animated: true)
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "Email or password is not matching", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
