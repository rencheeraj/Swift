//
//  CartManager.swift
//  FurnitureEcommerce
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import Foundation
class CartManager: ObservableObject{
    @Published private(set) var products : [ProductModel] = []
    
    @Published private(set) var total : Int = 0
    
    func addToCart(product: ProductModel){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: ProductModel){
        products = products.filter{ $0.id != product.id}
        total -= product.price
    }
}
