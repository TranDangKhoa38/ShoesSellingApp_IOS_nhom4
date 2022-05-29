//
//  Account.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/28/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import Foundation
class User {
    var email:String = ""
    var password: String = ""
    convenience init(email:String, password: String){
        self.init()
        self.email = email
        self.password = password
    }
}
var userArr = [
        User(email: "acb@gmail.com", password: "123456"),
        User(email: "khoa@gmail.com", password: "123")
]
