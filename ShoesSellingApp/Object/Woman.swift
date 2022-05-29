//
//  Woman.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import Foundation
import UIKit
class WomanShoes {
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


class ListOfWomanShoes {
    var productsArray: [WomanShoes] = []
    
    func addProdcutsInToList() -> [WomanShoes] {
        let car = WomanShoes(imageName:"Woman Shoes 1", productName: "Woman Shoes 1", productPrice: 4000, isProductAddedToCart: false, productCount: 0)
        let mobile = WomanShoes(imageName:"Woman Shoes 2", productName: "Woman Shoes 2", productPrice: 1000, isProductAddedToCart: false, productCount: 0)
        let bike = WomanShoes(imageName:"Woman Shoes 3", productName: "Woman Shoes 3", productPrice: 2000, isProductAddedToCart: false, productCount: 0)
        let laptop = WomanShoes(imageName:"Woman Shoes 4", productName: "Woman Shoes 4", productPrice: 2500, isProductAddedToCart: false, productCount: 0)
        let charger = WomanShoes(imageName:"Woman Shoes 5", productName: "Woman Shoes 5", productPrice: 100, isProductAddedToCart: false, productCount: 0)
        
        productsArray.append(car)
        productsArray.append(mobile)
        productsArray.append(bike)
        productsArray.append(laptop)
        productsArray.append(charger)
        return productsArray
    }
    
}
