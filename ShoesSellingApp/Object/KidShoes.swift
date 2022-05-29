//
//  KidShoes.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/26/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import Foundation
import UIKit
class KidShoes {
    var imageName:String = "Image"
    var productName: String = ""
    var productPrice: Int = 0
    var isProductAddedToCart: Bool = false
    var productCount: Int = 0
    convenience init(imageName:String, productName: String, productPrice: Int, isProductAddedToCart: Bool, productCount: Int){
        self.init()
        self.imageName = imageName
        self.productName = productName
        self.productPrice = productPrice
        self.isProductAddedToCart = isProductAddedToCart
        self.productCount = productCount
    }
}


class ListOfKidShoes {
    var productsArray: [KidShoes] = []
    
    func addProdcutsInToList() -> [KidShoes] {
        let car = KidShoes(imageName:"Kid Shoes 1", productName: "Kid Shoes 1", productPrice: 4000, isProductAddedToCart: false, productCount: 0)
        let mobile = KidShoes(imageName:"Kid Shoes 2",productName: "Kid Shoes 2", productPrice: 1000, isProductAddedToCart: false, productCount: 0)
        let bike = KidShoes(imageName:"Kid Shoes 3",productName: "Kid Shoes 3", productPrice: 2000, isProductAddedToCart: false, productCount: 0)
        let laptop = KidShoes(imageName:"Kid Shoes 4",productName: "Kid Shoes 4", productPrice: 2500, isProductAddedToCart: false, productCount: 0)
        let charger = KidShoes(imageName:"Kid Shoes 5",productName: "Kid Shoes 5", productPrice: 100, isProductAddedToCart: false, productCount: 0)
        
        productsArray.append(car)
        productsArray.append(mobile)
        productsArray.append(bike)
        productsArray.append(laptop)
        productsArray.append(charger)
        return productsArray
    }
    
}
