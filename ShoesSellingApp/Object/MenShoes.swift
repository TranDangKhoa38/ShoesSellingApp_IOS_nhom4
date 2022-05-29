//
//  MenShoes.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import Foundation
import UIKit
class MenShoes {
    var imageName:String = "Image"
    var productName: String = ""
    var productPrice: Int = 0
    var isProductAddedToCart: Bool = false
    var productCount: Int = 0
    convenience init(imageName:String, productName: String, productPrice: Int, isProductAddedToCart: Bool, productCount: Int) {
        self.init()
        self.imageName = imageName
        self.productName = productName
        self.productPrice = productPrice
        self.isProductAddedToCart = isProductAddedToCart
        self.productCount = productCount
    }
}


class ListOfMenShoes {
    var productsArray: [MenShoes] = []
    
    func addProdcutsInToList() -> [MenShoes] {
        let car = MenShoes(imageName: "Men Shoes 1", productName: "Men Shoes 1", productPrice: 4000, isProductAddedToCart: false, productCount: 0)
        let mobile = MenShoes(imageName: "Men Shoes 2", productName: "Men Shoes 2", productPrice: 1000, isProductAddedToCart: false, productCount: 0)
        let bike = MenShoes(imageName: "Men Shoes 3", productName: "Men Shoes 3", productPrice: 2000, isProductAddedToCart: false, productCount: 0)
        let laptop = MenShoes(imageName: "Men Shoes 4",productName: "Men Shoes 4", productPrice: 2500, isProductAddedToCart: false, productCount: 0)
        let charger = MenShoes(imageName: "Men Shoes 5",productName: "Men Shoes 5", productPrice: 100, isProductAddedToCart: false, productCount: 0)
        
        productsArray.append(car)
        productsArray.append(mobile)
        productsArray.append(bike)
        productsArray.append(laptop)
        productsArray.append(charger)
        return productsArray
    }
    
}
